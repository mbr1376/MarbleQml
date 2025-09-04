import QtQuick 2.15

Item {
    width: 60
    height: 60
    property string pathicon: ""
    Rectangle{
        id: rectangle
        anchors.fill: parent
        color: "#88000000"
        radius: 50

        Image {
            id: image
            width: 30
            height: 30
            source: pathicon
            anchors.centerIn: parent
            fillMode: Image.PreserveAspectFit
        }
    }
}
