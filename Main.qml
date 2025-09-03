import QtQuick
import org.kde.marble
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    MarbleItem
    {
        anchors.fill: parent
        id: marble
        visible: true
        focus: true
        PinchArea
        {
            anchors.fill: parent
            enabled: true
            objectName: "pinchArea"
            onPinchStarted: { marble.handlePinchStart(pinch.center) }
            onPinchUpdated: { marble.handlePinchUpdate(pinch.center, pinch.scale) }
            onPinchFinished:{ marble.handlePinchEnd(pinch.center, false) }
        }
        width: 600
        height: 600
        showFrameRate: false
        projection: MarbleItem.Spherical
        mapThemeId: earth/openstreetmap/openstreetmap.dgml
        showAtmosphere: false
        showCompass: false
        showClouds: false
        showCrosshairs: false
        showGrid: false
        showOverviewMap: false
        showOtherPlaces: false
        showScaleBar: false
        showBackground: true
    }
}
