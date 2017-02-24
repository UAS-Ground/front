import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtPositioning 5.5
import QtLocation 5.6
import QtQuick.Window 2.0
import QtCharts 2.0

Item {
    width: 1200
    height: 900
    property alias label: label
    id:machineHealthPage

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
                text: qsTr("MACHINE HEALTH")
                font.pointSize: 24
                color: "#E0F2F1"

            }

        }

        Rectangle {
            id: machineHealthRect
            anchors.top: titleRect.bottom
            anchors.topMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 50

            radius: 10
            width: parent.width * 0.8
            height: parent.height*0.75
            //color: "black"
            color: "#009688"


            Label {
                anchors.centerIn: parent
                id: camera
                text: qsTr("[MACHINE HEALTH DATA HERE]")
                font.pointSize: 30
                color: "white"

            }

            Rectangle {
                id: battery
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 20
                anchors.topMargin: 20
                width: parent.width * 0.2
                height: parent.height * 0.2
                color: "#009688"
                border.color: "#B2DFDB"
                border.width: 5
                radius: 5

                Label {
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    //anchors.leftMargin: 15
                    anchors.topMargin: 10
                    text: qsTr("Battery")
                    color: "#B2DFDB"
                    font.pixelSize: 25
                }

                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 15
                    text: qsTr("83%")
                    color: "#B2DFDB"
                    font.pixelSize: 65
                }
            }

            Rectangle {
                id: temperature
                anchors.left: battery.right
                anchors.top: parent.top
                anchors.leftMargin: 20
                anchors.topMargin: 20
                width: parent.width * 0.2
                height: parent.height * 0.2
                color: "#009688"
                border.color: "#B2DFDB"
                border.width: 5
                radius: 5

                Label {
                    anchors.top: parent.top
                    anchors.horizontalCenter: parent.horizontalCenter
                    //anchors.leftMargin: 15
                    anchors.topMargin: 10
                    text: qsTr("Internal Temperature")
                    color: "#B2DFDB"
                    font.pixelSize: 17
                }

                Label {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.verticalCenterOffset: 15
                    text: qsTr("100°")
                    color: "#B2DFDB"
                    font.pixelSize: 65
                }
            }


        }


        Rectangle {
            id: healthOptionsRect
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
      }



    }

}
