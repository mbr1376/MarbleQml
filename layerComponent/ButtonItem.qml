import QtQuick 2.15

Item {
    id:_root
    width: 60
    height: 60
    property string pathicon: ""
    signal clicked(bool check)
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
        MouseArea{
            property bool check: true
            anchors.fill: parent
            onClicked: {
                if (check){
                    _root.clicked(check)
                    check=false
                }else{
                    _root.clicked(check)
                    check= true
                }

            }
        }
    }
}
