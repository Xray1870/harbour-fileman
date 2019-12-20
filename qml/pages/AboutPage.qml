import QtQuick 2.2
import Sailfish.Silica 1.0
import "./components"

Page {
    id: aboutPage

    allowedOrientations: Orientation.All

    SilicaFlickable {
        id: aboutFlickable
        anchors.fill: parent
        contentHeight: column.height

        PullDownMenu
        {
            MenuItem
            {
                text: qsTr("Fileman translations")
                onClicked: pageStack.push(Qt.resolvedUrl("TranslationsPage.qml"))
            }
        }

        Column {
            id: column
            anchors {
                top: parent.top
                horizontalCenter: parent.horizontalCenter
            }
            width: Math.min(Screen.width, aboutFlickable.width)
            spacing: Theme.paddingLarge

            Item {
                width: parent.width
                height: Theme.paddingLarge
            }

            SectionHeader { text: qsTr("About") + " Fileman" }

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: Qt.resolvedUrl("/usr/share/icons/hicolor/172x172/apps/harbour-fileman.png")
                width: Theme.iconSizeExtraLarge
                height: Theme.iconSizeExtraLarge
                smooth: true
                asynchronous: true
            }

            AboutLabel {
                font.pixelSize: Theme.fontSizeLarge
                color: Theme.highlightColor
                text: "Fileman v" + Qt.application.version
            }

            AboutLabel {
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.primaryColor
                text: qsTr("Copyright © 2019-2020 by Rudi Timmermans.")
            }

            Button {
                text: qsTr("Write a mail")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: Qt.openUrlExternally("mailto:rudi.timmer@mail.ch")
            }

            AboutLabel {
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.primaryColor
                text: qsTr("Fileman is a File Manager for Sailfish OS.")
            }

            SectionHeader { text: qsTr("Donations") }

            AboutLabel {
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.primaryColor
                text: qsTr("If you like my work and want to buy me a beer, feel free to do it!")
            }

            Button {
                text: qsTr("Donate with Paypal")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: Qt.openUrlExternally("https://www.paypal.com/cgi-bin/webscr?cmd=_s-xclick&hosted_button_id=29THE9VFMZ4PS");
            }

            SectionHeader { text: qsTr("Icons") }

            AboutLabel {
                font.pixelSize: Theme.fontSizeSmall
                text: qsTr("Icons made by Gregguh.")
            }

            SectionHeader { text: qsTr("Thanking") }

            AboutLabel {
                font.pixelSize: Theme.fontSizeSmall
                text: qsTr("Thanks to Velox and Sargo-devel for the help on the Search function.")
            }

            SectionHeader { text: qsTr("Licensing") }

            AboutLabel {
                font.pixelSize: Theme.fontSizeSmall
                text: qsTr("Source code is available at GitHub. Translations, bug reports and other contributions are welcome!")
            }

            Button {
                text: qsTr("GitHub")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: Qt.openUrlExternally("https://github.com/Xray1870/harbour-fileman")
            }

            Button {
                text: qsTr("Report an Issue")
                anchors.horizontalCenter: parent.horizontalCenter
                onClicked: Qt.openUrlExternally("https://github.com/Xray1870/harbour-fileman/issues")
            }

            AboutLabel {
                font.pixelSize: Theme.fontSizeSmall
                color: Theme.primaryColor
                text: qsTr("Fileman is free software released under the GNU General Public License (GPL), version 3 or later.")
            }
          }
        }
      }
