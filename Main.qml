import QtQuick
import org.kde.marble
import "aboutComponent" as About
import "layerComponent" as Layer
import "toolsComponent" as Tools
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
        Placemark {
                //coordinate: QtPositioning.coordinate(35.6892, 51.3890) // عرض جغرافیایی، طول جغرافیایی
                //iconSource: "qrc:/icons/marker.png"  // مسیر آیکون مارکر، می‌توانید آیکون دلخواه خود را انتخاب کنید
                //visible: true
            }
      onZoomChanged:function(){
          if (zoom < 1500){
              marble.centerOn(51.3890,35.6892,true)
              setZoom(1500)

          }
      }
    }
    Component.onCompleted: {
        marble.centerOn(51.3890,35.6892,true)
        marble.setZoom(5000)

    }
    Tools.ToolsItem{
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
    Layer.LayerItems{
        anchors.left:parent.left
        anchors.leftMargin: 10
        anchors.top:parent.top
        anchors.topMargin: 15
        onMapChanged:function(path){

            marble.mapThemeId = path
        }
         onPowerOff: close()
         onShowSettingsLayer: console.log("show  layer")
         onShowSettingsMap:  console.log("show  Map")
    }
    About.LayerAbout{
        anchors.bottom: parent.bottom
        anchors.margins: -10
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
