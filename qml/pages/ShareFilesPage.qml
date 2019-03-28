import QtQuick 2.2
import Sailfish.Silica 1.0
import Nemo.FileManager 1.0
import Sailfish.TransferEngine 1.0
 
Page {
    id: page

    property string file

    allowedOrientations: Orientation.All
 
    ShareMethodList {
        id: shareMethodList
        anchors.fill: parent
        header: PageHeader {
            title: qsTr("Share")
        }

        source: "file://" + clipboard.getSelectedFiles()

        content: {
            "data": "file://" + clipboard.getSelectedFiles(),
            "icon": "image://theme/icon-m-file-image"
        }      
 
        ViewPlaceholder {
            enabled: shareMethodList.model.count === 0
            text: qsTr("No sharing accounts available!")
        }
    }
}
