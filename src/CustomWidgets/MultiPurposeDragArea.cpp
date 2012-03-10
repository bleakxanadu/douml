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
#include "CustomWidgets/MultiPurposeDragArea.h"
#include <QMouseEvent>

MultiPurposeDragArea::MultiPurposeDragArea(QWidget* _parent):QWidget(_parent)
{}

MultiPurposeDragArea::~MultiPurposeDragArea()
{
}

void MultiPurposeDragArea::wheelEvent(QWheelEvent *event)
{
    int sign = event->delta() > 0 ? 1 : -1;
    emit changeTab(sign);
}

void MultiPurposeDragArea::mouseMoveEvent(QMouseEvent *event)
{
    if(modificationMode == wmm_none)
        return;

    emit newCoordinates(mapToGlobal(event->pos()));
}

void MultiPurposeDragArea::mousePressEvent(QMouseEvent *event)
{
    if(event->button() == Qt::LeftButton || event->button() == Qt::RightButton)
    {
        grabMouse();
        if(event->button() == Qt::LeftButton )
        {
            modificationMode = wmm_drag;
            emit initiateMove(mapToGlobal(event->pos()));
        }
        if(event->button() == Qt::RightButton )
        {
            modificationMode = wmm_resize;
            emit initiateResize(mapToGlobal(event->pos()));
        }
    }
}

void MultiPurposeDragArea::mouseReleaseEvent(QMouseEvent *event)
{
    if(event->button() == Qt::LeftButton || event->button() == Qt::RightButton)
    {
        modificationMode = wmm_none;
        emit endResize();
        releaseMouse();
    }
}
