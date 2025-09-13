import QtQuick 2.15
import QtQuick.Layouts
import "utils.js" as Utils
Item {
    id:_root
    width: 600
    height: 60
    property var loadedObjectLayerMap: null
    signal mapChanged(string path);

    FontLoader {
            id: _Font
            source: "../fonts/Poppins-Regular.ttf"
        }
    Rectangle{
        id:_rec
        anchors.left: parent.left
        height: parent.height
        width: 180
        radius: 50
        color: "#88000000"
        MouseArea{
            anchors.fill: parent
            property bool _check: true
            onClicked: {
                if (_check){

                   loadedObjectLayerMap = Utils.loadFileAt("StartItem.qml",_rec.x,_rec.y+70,_root)
                    _check =false
                }else{

                    loadedObjectLayerMap.closeAndDestroy()
                    _check =true
                }
            }

        }

        Image {
            id: image
            width: 45
            height: 45
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 15
            source: "../icons/earth.png"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: text1

            color: "#fdfafa"
            text: qsTr("Gis")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: image.right
            anchors.leftMargin: 5
            font.pixelSize: 30
            verticalAlignment: Text.AlignVCenter
            font.family: _Font.font.family
            font.bold: true
        }

        Text {
            id: text2
            color: "#b7b7b7"
            text: qsTr("system")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: text1.right
            anchors.leftMargin: 9
            font.pixelSize: 12
            font.family: _Font.font.family
            font.bold: true
        }
    }

    RowLayout {
        id: rowLayout
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left:_rec.right
        anchors.leftMargin: 60
        ButtonItem{
            pathicon: "../icons/menu.png"
            Layout.alignment: Qt.AlignHCenter

        }
        ButtonItem{
            pathicon: "../icons/Layers.png"
            Layout.alignment: Qt.AlignHCenter
            onClicked:function(check) {
               if (check){
                  loadedObjectLayerMap = Utils.loadFileAt("LayerMap.qml",rowLayout.x + 10,rowLayout.y+80,_root,_root)
               }else
                   loadedObjectLayerMap.destroy()

            }
        }
        ButtonItem{
            pathicon: "../icons/Area.png"
            Layout.alignment: Qt.AlignHCenter
        }
        ButtonItem{
            pathicon: "../icons/loacation.png"
            Layout.alignment: Qt.AlignHCenter
        }
        ButtonItem{
            pathicon: "../icons/weather.png"
            Layout.alignment: Qt.AlignHCenter
        }
        ButtonItem{
            pathicon: "../icons/search.png"
            Layout.alignment: Qt.AlignHCenter
        }

    }

}
