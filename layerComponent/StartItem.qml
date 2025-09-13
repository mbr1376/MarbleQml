import QtQuick 2.15
import Qt5Compat.GraphicalEffects
import QtQuick.Layouts

Item {
    id:_root
    width: 180
    height: _model.count * 60
    FontLoader {
            id: _Font
            source: "../fonts/Roboto-Bold.ttf"
        }
    Component{
        id:contectDelegate
        Item {
                     width: 150; height: 40
                     Row {
                         spacing: 10
                         Image {
                             width: 25
                             height: 25
                             fillMode: Image.PreserveAspectFit
                             source: pathfile
                         }
                         Text {
                             id:_txt
                             text: name
                             color: "white"
                             font.family: _Font.font.family
                             font.pixelSize: 14
                             verticalAlignment: Text.AlignVCenter
                             anchors.verticalCenter: parent.verticalCenter

                         }
                     }
                     MouseArea{
                         anchors.fill: parent
                         hoverEnabled: true
                         onEntered: _txt.color = "#4F8BD4"
                         onExited: _txt.color = "white"
                         onClicked: {
                             if (name === "Power OFF"){

                             }

                         }
                     }
                 }
    }
    ListModel {
        id:_model
        ListElement {
            name: "Setting Layer"
            pathfile: "../icons/settings.png"
        }
        ListElement {
            name: "Setting Map"
            pathfile: "../icons/settings.png"
        }
        ListElement {
            name: "Power OFF"
            pathfile: "../icons/powerOff.png"
        }
    }
    Rectangle {
        id: rectangle
        color: "#88000000"
        radius: 20
        border.color: "#414141"
        border.width: 1
        anchors.fill: parent
        ListView{
            clip: true
            focus: true
            anchors.fill: parent
            anchors.margins: 10
            delegate: contectDelegate
            model: _model
            spacing: 5
        }
    }

    Component.onCompleted: {
          heightAnimation.start()
      }

      PropertyAnimation {
          id: heightAnimation
          target: _root
          property: "height"
          from: 0
          to: _model.count * 50
          duration: 1000  // 1 second animation
          easing.type: Easing.InOutQuad
      }
      PropertyAnimation {
              id: heightCloseAnimation
              target: _root
              property: "height"
              from: _model.count * 50
              to: 0
              duration: 1000
              easing.type: Easing.InOutQuad

              onStopped: {
                  // Once animation ends, destroy this object
                  _root.destroy()
              }
          }
      function closeAndDestroy() {
              heightCloseAnimation.start()
          }

}
