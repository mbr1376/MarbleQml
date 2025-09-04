import QtQuick

Item {
    id:_root
    width: 30
    height: 30
    property string pathIcon: ""
    signal clicked()
    Image {
        anchors.fill: parent
        source: pathIcon
        fillMode: Image.PreserveAspectFit

    }
    MouseArea{
        anchors.fill: parent
        onClicked: _root.clicked()
    }

}
