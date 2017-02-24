import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtPositioning 5.5
import QtLocation 5.6
import QtQuick.Window 2.0

Item {
    width: 1200
    height: 900
    property alias label: label
    id:droneViewPage

    ColumnLayout{
        id:rootLayout
        width: 1200
        anchors.fill: parent

        Rectangle {
            id:titleRect
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 100
            radius: 10
            /*
            gradient: Gradient {
                GradientStop { position: 0.0; color: "black" }
                GradientStop { position: 1.0; color: "grey" }
            } */
            color: "#004D40"

            Label {
                anchors.centerIn: parent
                id: label
                text: qsTr("DRONE VIEW")
                font.pointSize: 28
                color: "white"

            }

        }

        Rectangle {
            id: cameraRect
            anchors.top: titleRect.bottom
            anchors.topMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 50

            radius: 10
            width: parent.width * 0.8
            height: parent.height*0.75
            color: "black"

            Label {
                anchors.centerIn: parent
                id: camera
                text: qsTr("[CAMERA VIEW HERE]")
                font.pointSize: 30
                color: "white"

            }


        }


        Rectangle {
            id: vidCommandsRect
            anchors.top: titleRect.bottom
            anchors.topMargin: 40
            anchors.right: parent.right
            anchors.rightMargin: 50
            radius: 10
            width: parent.width * 0.5
            height: parent.height*0.75
            /*
            gradient: Gradient {
                GradientStop { position: 0.0; color: "black" }
                GradientStop { position: 1.0; color: "grey" }
            } */
            color: "#004D40"

            Button {
                id: option1
                text: qsTr("Video Option 1")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 25
                width: 240
                height: 75
                font.pixelSize: 20

            }

            Button {
                id: option2
                text: qsTr("Video Option 2")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: option1.bottom
                anchors.topMargin: 15
                width: 240
                height: 75
                font.pixelSize: 20

            }

            Button {
                id: option3
                text: qsTr("Video Option 3")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: option2.bottom
                anchors.topMargin: 15
                width: 240
                height: 75
                font.pixelSize: 20

            }
      }



    }

}
