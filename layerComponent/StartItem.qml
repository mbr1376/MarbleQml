import QtQuick 2.15
import Qt5Compat.GraphicalEffects

Item {
    id:_root
    width: 180
    height: _model.count * 10
    FontLoader {
            id: _Font
            source: "../fonts/Roboto-Bold.ttf"
        }
    Component{
        id:contectDelegate
        Item {
                     width: 150; height: 40
                     Column {
                         Image {
                             width: 40
                             height: 40
                             fillMode: Image.PreserveAspectFit
                             source: pathfile
                         }
                         Text { text: name
                             color: "white"
                             font.family: _Font.font.family
                             font.pixelSize: 14
                         }
                     }
                 }
    }
    ListModel {
        id:_model
        ListElement {
            name: "Setting Layer"
            pathfile: "555 3264"
        }
        ListElement {
            name: "Setting Map"
            pathfile: "555 8426"
        }
        ListElement {
            name: "power Off"
            pathfile: "555 0473"
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
            anchors.fill: parent
            anchors.margins: 10
            delegate: contectDelegate
            model: _model
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
          to: _model.count * 60
          duration: 1000  // 1 second animation
          easing.type: Easing.InOutQuad
      }
      PropertyAnimation {
              id: heightCloseAnimation
              target: _root
              property: "height"
              from: _model.count * 60
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
