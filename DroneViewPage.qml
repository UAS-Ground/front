import QtQuick 2.7
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtPositioning 5.5
import QtLocation 5.6
import QtQuick.Window 2.0
import CVCamera 1.0
import QtMultimedia 5.5

Item {
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    property alias label: label
    id:droneViewPage
    readonly property int itemWidth: Math.max(brightnessSlider.implicitWidth, Math.min(brightnessSlider.implicitWidth * 2, droneViewPage.availableWidth / 3))

/*
    Connections {
        target: CVController
    }
*/
    Timer {
        id: printTimer
        interval: 500; running: true; repeat: true
        onTriggered: {
            //console.log("Looking at cvImage: " + camera.cvImage);

        }
    }

    ColumnLayout{
        id:rootLayout
        width: parent.width
        anchors.fill: parent

        Rectangle {
            id:titleRect
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.3
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
            width: droneViewPage.width * 0.4

            radius: 10
            height: parent.height*0.75
            color: "black"



//            Label {
//                anchors.centerIn: parent
//                id: camera
//                text: qsTr("[CAMERA VIEW HERE]")
//                font.pointSize: 30
//                color: "white"

//            }



            CVCamera {
                id: camera
                device: deviceBox.currentIndex
                size: "640x480"
                anchors.centerIn: parent

            }

            VideoOutput {
                anchors.top: camera.top
                id: output
                source: camera
                anchors.centerIn: parent

            }
            ComboBox {
                id: deviceBox
                width: 200
                anchors.top: output.bottom
                anchors.horizontalCenter: output.horizontalCenter
                model: camera.deviceList
            }
            Button {
                text: "Process CV Frame"
                onClicked: {
                    //CVController.processImageFrame(camera.cvImage);

                    camera.myMcFunction(String.toString("hey"));
                }
            }


        }


        Rectangle {
            id: vidCommandsRect
            anchors.top: titleRect.bottom
            anchors.topMargin: 40
            anchors.right: parent.right
            anchors.rightMargin: 50
            radius: 10
            width: droneViewPage.width * 0.4
            height: parent.height*0.75
            /*
            gradient: Gradient {
                GradientStop { position: 0.0; color: "black" }
                GradientStop { position: 1.0; color: "grey" }
            } */
            color: "#004D40"

            Button {
                id: option1
                text: qsTr("Object Detection")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 25
                width: 240
                height: 75
                font.pixelSize: 20
                property var bgOff: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 25
                    border.width: 1
                    border.color: "#888"
                    radius: 4
                    color: option1.objDetectOn ? "white" : "grey"
                }
                property var objDetectOn: false
                onClicked: {
                    option1.objDetectOn = !option1.objDetectOn;
                    camera.toggleObjectDetection();
                }

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


            Slider {
                anchors.top: option3.bottom
                id: brightnessSlider
                value: 0.5
                width: option3.width
                anchors.horizontalCenter: option3.horizontalCenter
                onValueChanged: {
                    console.log("Value changed: " + brightnessSlider.value);
                    camera.setBrightness(Math.floor(brightnessSlider.value * 100));
                }
            }

            Slider {
                id: contrastSlider
                anchors.top: brightnessSlider.bottom
                value: 0.5
                width: option3.width
                anchors.horizontalCenter: option3.horizontalCenter
                onValueChanged: {
                    console.log("Value changed: " + contrastSlider.value);
                    camera.setContrast(contrastSlider.value * 3.0);
                }
            }


      }



    }

}
