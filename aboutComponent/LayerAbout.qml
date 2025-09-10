import QtQuick 2.15
import QtQuick.Layouts 2.15

Item {
    width: 477
    height: 40
    id:_root
    FontLoader {
            id: _Font
            source: "../fonts/Roboto-Bold.ttf"
        }
    Rectangle {
        id: rectangle
        color: "#000000"
        border.color: "#414141"
        anchors.fill: parent
        opacity: 0.3
        radius: 15
        Behavior on height {
                    NumberAnimation { duration: 1000; easing.type: Easing.InOutQuad }
                }
    }

    RowLayout {
        id: rowLayout
        anchors.fill: parent
        anchors.margins: 10
        function toggleHeight() {
                    _root.height = 300 ;

                    rectangle.height =  300;
                }
        Text{
            color: "#DDDDDD"
            text: "About us"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            font.family: _Font.font.family
            font.pixelSize: 14
            MouseArea{
                anchors.fill: parent
                onClicked: rowLayout.toggleHeight()
                cursorShape: Qt.PointingHandCursor
            }

        }
        Text{
            color: "#DDDDDD"
            text: "Consept"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            font.family: _Font.font.family
            font.pixelSize: 14
            MouseArea{
                anchors.fill: parent
                onClicked: rowLayout.toggleHeight()
                cursorShape: Qt.PointingHandCursor
            }

        }
        Text{
            color: "#DDDDDD"
            text: "Publications"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            font.family: _Font.font.family
            font.pixelSize: 14
            MouseArea{
                anchors.fill: parent
                onClicked: rowLayout.toggleHeight()
                cursorShape: Qt.PointingHandCursor
            }

        }
        Text{
            color: "#DDDDDD"
            text: "Data"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            font.family: _Font.font.family
            font.pixelSize: 14
            MouseArea{
                anchors.fill: parent
                onClicked: rowLayout.toggleHeight()
                cursorShape: Qt.PointingHandCursor
            }

        }
        Text{
            text: "Guide"
            color: "#DDDDDD"
            Layout.fillHeight: true
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignVCenter
            font.family: _Font.font.family
            font.pixelSize: 14
            MouseArea{
                anchors.fill: parent
                onClicked: rowLayout.toggleHeight()
                cursorShape: Qt.PointingHandCursor
            }
        }
        Image {

            source: "../icons/arrow.png"
            fillMode: Image.PreserveAspectFit
            width: 12
            height: 10
            Layout.alignment: Qt.AlignVCenter
            MouseArea{
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                onClicked: {
                    _root.height = 40 ;

                    rectangle.height =  40;
                }

            }
        }
    }

}
