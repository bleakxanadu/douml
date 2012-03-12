// *************************************************************************
//
// Copyright 2012-2012 Nikolai Marchenko  .
//
// This file is part of the BreezeUML Uml Toolkit.
//
// This program is free software; you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation; either version 2 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software
// Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
//
// e-mail : enmarantispam@gmail.com
//
// *************************************************************************
#include "CustomWidgets/EdgeMenuToolBar.h"
#include "misc/ClipboardManager.h"
#include <QAction>

EdgeMenuToolBar::EdgeMenuToolBar(QWidget * _parent) : QToolBar(_parent)
{
    clipboardMenu = new QMenu(this);
    lastClipboardItemShown = 0;
    clipboardListSize = 10;
    connect(&decayTimer, SIGNAL(timeout()), this, SLOT(hide()));
    An<ClipboardManager> clipboard;
    connect(this, SIGNAL(putIntoClipboard(QString)),clipboard.getData(), SLOT(OnPutItemIntoClipboard(QString)));
}

EdgeMenuToolBar::~EdgeMenuToolBar()
{
}

void EdgeMenuToolBar::SetRelativeOrientation(int value)
{
    relativeOrientation = value;
}

void EdgeMenuToolBar::leaveEvent(QEvent *event)
{

    decayTimer.start(500);
}

void EdgeMenuToolBar::enterEvent(QEvent *event)
{
    decayTimer.stop();
}

void EdgeMenuToolBar::mouseMoveEvent(QMouseEvent *event)
{
}

void EdgeMenuToolBar::IntitiateMove(QPoint origin)
{
    decayTimer.stop();
    modificationMode = wmm_drag;
    modificationOrigin = origin;
    toolbarOrigin = mapToGlobal(QPoint());
}

void EdgeMenuToolBar::IntitiateResize(QPoint)
{
    decayTimer.stop();
    modificationMode = wmm_resize;
}

void EdgeMenuToolBar::MoveThis(QPoint origin, QPoint newPoint)
{
    this->move(newPoint - origin + toolbarOrigin);
}

void EdgeMenuToolBar::FillClipboardMenu(int base)
{
    clipboardMenu->clear();
    An<ClipboardManager> clipboard;
    QStringList strings = clipboard->GetStrings();
    if(base != 0)
    {
        QAction* lessClipboard = new QAction("Less Clipboard", clipboardMenu);
        connect(lessClipboard, SIGNAL(triggered()), this, SLOT(OnLessClipboardRequested()));
        clipboardMenu->addAction(lessClipboard);
    }
    int maxItems = strings.size() > 10 ? 10 : strings.size();
    int i = base;
    for(i; i < maxItems; ++i)
    {
        QString text = strings.at(strings.size() - 1 - i);
        clipboard->blockSignals(true);
        QString itemText;
        if(text.length() < 15)
            itemText = text;
        else
        {
            text.left(15);
            itemText = text  + "...";
        }
        QAction* action = new QAction(itemText, clipboardMenu);
        action->setData(text);
        connect(action, SIGNAL(triggered()), this, SLOT(OnPutIntoClipboardRequested()));
        clipboard->blockSignals(false);
        clipboardMenu->addAction(action);

    }
    lastClipboardItemShown+=i;
    if(lastClipboardItemShown < strings.size())
    {
        QAction* moreClipboard = new QAction("More Clipboard", clipboardMenu);
        connect(moreClipboard, SIGNAL(triggered()), this, SLOT(OnMoreClipboardRequested()));
        clipboardMenu->addAction(moreClipboard);
    }

}

void EdgeMenuToolBar::OnInitiateMove(QPoint origin)
{
    IntitiateMove(origin);
}

void EdgeMenuToolBar::OnInitiateResize(QPoint origin)
{
    IntitiateResize(origin);
}

void EdgeMenuToolBar::OnNewCoordinatesReceived(QPoint newPoint)
{
    if(modificationMode == wmm_drag)
        MoveThis(modificationOrigin, newPoint);
}

void EdgeMenuToolBar::OnEndResize()
{
    this->hide();
}

void EdgeMenuToolBar::OnEndMove()
{
    this->show();
    //todo to implement
}

void EdgeMenuToolBar::OnClipboardRequested()
{
    FillClipboardMenu(0);
    clipboardMenu->exec(this->mapToGlobal(QPoint(0,0)));
}

void EdgeMenuToolBar::OnMoreClipboardRequested()
{
    FillClipboardMenu(lastClipboardItemShown);
}

void EdgeMenuToolBar::OnLessClipboardRequested()
{
    FillClipboardMenu(lastClipboardItemShown - clipboardListSize);
}

void EdgeMenuToolBar::OnPutIntoClipboardRequested()
{
    QAction* senderAction = qobject_cast<QAction*>(sender());
    emit putIntoClipboard(senderAction->data().toString());
}
