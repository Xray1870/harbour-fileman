import QtQuick 2.0
import Sailfish.Silica 1.0
import "./components"

Page {
    id: page

    allowedOrientations: Orientation.All

    Label {
        anchors {
            top: parent.top
            topMargin: Theme.paddingLarge
            left: parent.left
            leftMargin: Theme.horizontalPageMargin
            right: parent.right
            rightMargin: Theme.horizontalPageMargin
        }
        color: Theme.highlightColor
        font.pixelSize: Theme.fontSizeMedium
        wrapMode: Text.WordWrap
        text: qsTr(
                  "<b>Fileman is a File Manager for Sailfish OS.</b>" + "<br><br>" +
                  "Fileman is free software released under the GNU General Public License (GPL), version 3 or later." + "<br><br>" +
                  "If you want to support Fileman and its development please consider donating." + "<br><br>" +
                  "Thank you very much for your donation to the development of Fileman!"
                  )
    }

    Grid {
        id: content
        anchors {
            bottom: parent.bottom
            bottomMargin: Theme.paddingLarge
        }
        width: parent.width
        columns: isPortrait ? 1 : 3
        rows: isPortrait ? 3 : 1

        PlainButton {
            text: qsTr("Donate!")
            onClicked: Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=BN7N7Q8U2PWFS")
        }

        PlainButton {
            text: qsTr("Don't show again")
            onClicked: {
                pageStack.replace(Qt.resolvedUrl("BackPage.qml"))
                settings.setDisclaimerShowed()
            }
        }
    }
}
