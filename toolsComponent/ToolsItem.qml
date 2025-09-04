import QtQuick
 import Qt5Compat.GraphicalEffects
import QtQuick.Layouts
Item {
    width: 60
    height: 360
    signal zooming()
    signal zoomout()

    Rectangle{
        id:_rec
        radius: 60
        anchors.fill: parent
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#56BAE1"
            }

            GradientStop {
                position: 1
                color: "#629DF3"
            }
            orientation: Gradient.Vertical
        }
    }
    DropShadow {
               anchors.fill: _rec
               source: _rec
               horizontalOffset: 5
               verticalOffset: 5
               radius: 10
               samples: 16
               color: "#80000000"


       }
    ColumnLayout {
               id: columnLayout
               anchors.fill: parent
               anchors.leftMargin: 5
               anchors.rightMargin: 5
               anchors.topMargin: 40
               anchors.bottomMargin: 40
               IconButtonItem{

                    Layout.alignment: Qt.AlignHCenter
                    pathIcon: "../icons/location.png"
                   // onClicked: zooming()
               }
               IconButtonItem{

                    Layout.alignment: Qt.AlignHCenter
                    pathIcon: "../icons/plus.svg"
                    onClicked: zooming()
               }
               IconButtonItem{
                    Layout.alignment: Qt.AlignHCenter
                    pathIcon: "../icons/minus.png"
                    onClicked: {
                        zoomout()
                    }
               }


    }

}
