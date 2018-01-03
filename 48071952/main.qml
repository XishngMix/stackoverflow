import QtQuick 2.9
import QtQuick.Window 2.2

import QtLocation 5.6
import QtPositioning 5.6

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Plugin {
        id: osmMapPlugin
        name: "osm"
    }

    Map {
        anchors.fill: parent
        plugin: osmMapPlugin
        center: QtPositioning.coordinate(56.006355, 92.860984)
        zoomLevel: 10

        MapPolyline {
            id: pl
            line.width: 3
            line.color: 'red'
        }
    }

    Connections{
        target: pathController
        onGeopathChanged: {
            var lines = []
            for(var i=0; i < pathController.geopath.size(); i++){
                lines[i] = pathController.geopath.coordinateAt(i)
            }
            pl.path = lines
        }
    }
}
