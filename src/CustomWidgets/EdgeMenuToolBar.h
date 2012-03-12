// *************************************************************************
//
// Copyright 2012-2012 Nikolai Marchenko.
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
#ifndef EDGEMENUTOOLBAR_H
#define EDGEMENUTOOLBAR_H
#include <QToolBar>
#include <QTimer>
#include <QMenu>
#include "CustomWidgets/MultiPurposeDragArea.h"

class EdgeMenuToolBar : public QToolBar
{
Q_OBJECT

public:
    EdgeMenuToolBar(QWidget * _parent = 0);
    ~EdgeMenuToolBar();
    void SetRelativeOrientation(int);
protected:
    //! called on window show()
    void leaveEvent ( QEvent * event );
    void enterEvent ( QEvent * event );
    void mouseMoveEvent ( QMouseEvent * event );
private:

    void IntitiateMove(QPoint);
    void IntitiateResize(QPoint);
    void MoveThis(QPoint,QPoint);
    void FillClipboardMenu(int);
    QPoint modificationOrigin;
    QPoint toolbarOrigin;
    EWidgetModificationMode modificationMode;
    QTimer decayTimer;
    int relativeOrientation;
    QMenu* clipboardMenu;
    int lastClipboardItemShown;
    int clipboardListSize;

public slots:
    virtual void OnInitiateMove(QPoint);
    virtual void OnInitiateResize(QPoint);
    virtual void OnNewCoordinatesReceived(QPoint);
    virtual void OnEndResize();
    virtual void OnEndMove();
    virtual void OnClipboardRequested();
    virtual void OnMoreClipboardRequested();
    virtual void OnLessClipboardRequested();
    virtual void OnPutIntoClipboardRequested();

signals:
    void putIntoClipboard(QString);

};


#endif // EDGEMENUTOOLBAR_H
