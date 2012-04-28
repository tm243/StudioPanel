/**
 *  (c) 2012
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *
 */

import QtQuick 1.1

Rectangle {
    width: 128
    height: 466

    Image {
        id: background
        source: "images/panel_bg.png"
    }

    Rectangle {
        id: sensitiveAreaRect

        width: 40
        height: 390
        anchors.centerIn: parent

        color: "transparent"

        MouseArea {
            id: sensitiveMouseArea
            anchors.fill: parent;

            onPressed: {
                moveSliderHandle(mouseY);
            }

            onPositionChanged: {
                moveSliderHandle(mouseY);
            }
        }

        Image {
            id: sliderHandle
            width: 79
            height: 82

            property int handleCenter: 11

            source: "images/handle.png"

            anchors.horizontalCenter: sensitiveAreaRect.horizontalCenter
        }
    }

    // the handle is the actual handle + shadow. The center of interest is not height / 2,
    // instead it is the actual handle's height/2

    function moveSliderHandle(mouseY) {
        var y = -sliderHandle.handleCenter;
        var yMax = (y + sensitiveMouseArea.height);
        var kY = y;
        if(mouseY > 0 && mouseY <= yMax)
            kY = mouseY;
        else if(mouseY > yMax)
            kY = yMax;

        sliderHandle.y = kY;
    }
}
