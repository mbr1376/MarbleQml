import QtQuick
import org.kde.marble
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Gis System")
    visibility: Window.FullScreen
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
        mapThemeId: "earth/openstreetmap/openstreetmap.dgml"
        showAtmosphere: true
        showCompass: false
        showClouds: true
        showCrosshairs: false
        showGrid: false
        showOverviewMap: false
        showOtherPlaces: false
        showScaleBar: false
        showBackground: true

        //center: Coordinate { longitude: 142.2; latitude: 11.35 }
    }
    Component.onCompleted: {
        marble.centerOn(51.3890,35.6892,true)
        marble.setZoom(5000)
    }
    ToolsItem{
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 10
        onZooming:function(val){
            marble.zoomIn()
        }
        onZoomout:function(val){
            marble.zoomOut()
        }



    }
    LayerItems{
        anchors.left:parent.left
        anchors.leftMargin: 10
        anchors.top:parent.top
        anchors.topMargin: 15
    }
}
