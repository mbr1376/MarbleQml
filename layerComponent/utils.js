function loadFileAt(filename, xpos, ypos, parent, _root) {
    var component = Qt.createComponent(filename)
    if (component.status === Component.Ready) {
        var obj = component.createObject(parent, { x: xpos, y: ypos })
        if (obj === null) {
            console.log("Error creating object")
        } else {
            obj.itemClicked.connect(function (path) {
                _root.mapChanged(path)
            })
        }
        return obj
    } else {
        console.log("Component error:", component.errorString())
        return null
    }
}
