import QtQuick 2.15

Item {
	width: 400
	height: 100

	ListModel {
		id:_model
		ListElement {
			pathimage: "../icons/mapLayer/openstreetmap-preview.png"
			source: "earth/openstreetmap/openstreetmap.dgml"
		}
		ListElement {
			pathimage: "../icons/mapLayer/bluemarble-preview.png"
			source: "earth/openstreetmap/blumarble.dgml"
		}
		ListElement {
			pathimage: "../icons/mapLayer/precip-dec-preview.png"
			source: "earth/openstreetmap/precip-dec.dgml"
		}
		ListElement {
			pathimage: "../icons/mapLayer/vectorosm-preview.png"
			source: "earth/openstreetmap/vectorosm.dgml"
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
					 border.width: 4
					 border.color: "#56BAE1"
					 color: "transparent"
					 z:1
					 Image {

						 anchors.fill: parent
						 anchors.margins: 4
						 source: pathimage
						 fillMode: Image.PreserveAspectFit
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
