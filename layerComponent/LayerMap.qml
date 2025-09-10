import QtQuick 2.15

Item {
	id:_root
	width: 400
	height: 100
	signal itemClicked(string source);



	property int  selectedIndex : 0

	ListModel {
		id:_model
		ListElement {
			pathimage: "../icons/mapLayer/openstreetmap-preview.png"
			source: "earth/openstreetmap/openstreetmap.dgml"
		}
		ListElement {
			pathimage: "../icons/mapLayer/bluemarble-preview.png"
			source: "earth/bluemarble/bluemarble.dgml"
		}
		ListElement {
			pathimage: "../icons/mapLayer/precip-dec-preview.png"
			source: "earth/precip-dec/precip-dec.dgml"
		}
		ListElement {
			pathimage: "../icons/mapLayer/vectorosm-preview.png"
			source: "earth/vectorosm/vectorosm.dgml"
		}

	}

	Component {
			 id: contactDelegate
			 Item {
				 width: 50; height: 50
				 property string _source: source
				 Rectangle{
					 anchors.fill: parent
					 radius: 10
					 border.width: 1
					 border.color: _root.selectedIndex === index ? "#206CC9" : "#56BAE1"
					 color: "transparent"
					 z:1
					 Image {

						 anchors.fill: parent
						 anchors.margins: 4
						 source: pathimage
						 fillMode: Image.PreserveAspectFit

						 }
					 MouseArea{
						 hoverEnabled: true
						 anchors.fill: parent
						 onEntered: parent.color = "#5556BAE1"
						 onExited: parent.color = "transparent"
						 onClicked: {
							 _root.selectedIndex = index
							 _root.itemClicked(source)
						 }
					 }
				 }
			 }
		 }
	ListView{
		anchors.fill: parent
		orientation: Qt.Horizontal
		delegate: contactDelegate
		model: _model
		spacing: 5

	}
}
