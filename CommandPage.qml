import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtPositioning 5.5
import QtLocation 5.6

Item {
    width: 1200
    height: 900
    property alias label: label
    id:rootItem
    Keys.enabled: true





    ColumnLayout{
        id:rootLayout
        width: 1200
        anchors.fill: parent

        Connections {
            target: ROSController


            onMessageReceived: {
                messageText.text = message


            }
        }


        Item {
            focus: true
            Keys.onReleased: {
                if(!event.isAutoRepeat){
                    console.log("im in the keyreased handler");
                    console.log("I received a key release from key " + event.key);
                    if (event.key === Qt.Key_D) {
                        ROSController.sendCommand("right-off");
                    } else if (event.key === Qt.Key_A) {
                        ROSController.sendCommand("left-off");
                    } else if (event.key === Qt.Key_W) {
                        ROSController.sendCommand("forward-off");
                    } else if (event.key === Qt.Key_S) {
                        ROSController.sendCommand("back-off");
                    } else if (event.key === Qt.Key_Up) {
                        ROSController.sendCommand("up-off");
                    } else if (event.key === Qt.Key_Down) {
                        ROSController.sendCommand("down-off");
                    }
                    event.accepted = true;

                }

            }

            Keys.onPressed: {
                if(!event.isAutoRepeat){
                    console.log("im in the keypress handler");
                    console.log("I received a key press from key " + event.key);
                    if (event.key === Qt.Key_D) {
                        ROSController.sendCommand("right-on");
                    } else if (event.key === Qt.Key_A) {
                        ROSController.sendCommand("left-on");
                    } else if (event.key === Qt.Key_W) {
                        ROSController.sendCommand("forward-on");
                    } else if (event.key === Qt.Key_S) {
                        ROSController.sendCommand("back-on");
                    } else if (event.key === Qt.Key_Up) {
                        ROSController.sendCommand("up-on");
                    } else if (event.key === Qt.Key_Down) {
                        ROSController.sendCommand("down-on");
                    }
                    event.accepted = true;

                }



            }
        }

        Rectangle {
            id:titleRect
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            width: 300
            height: 100
            radius: 10
            /*gradient: Gradient {
                GradientStop { position: 0.0; color: "#009688" }
                GradientStop { position: 1.0; color: "#004D40" }
            }*/
            color: "#009688"


            Label {
                anchors.centerIn: parent
                id: label
                text: qsTr("Commands")
                font.pointSize: 28
                color: "white"

            }


        }

        Rectangle {
            id:commandButtonsRect
            anchors.top: titleRect.bottom
            anchors.topMargin: 40
            anchors.horizontalCenter: parent.horizontalCenter
            radius: 10
            width: parent.width
            height: parent.height*0.75
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#009688" }
                GradientStop { position: 1.0; color: "#004D40" }
            }




            ColumnLayout {
                anchors.top: commandButtonsRect.top
                anchors.topMargin: 20
                anchors.horizontalCenter: parent.horizontalCenter


                Button {
                    anchors.topMargin: 20
                    width: 100
                    height: 50
                    id: gohome
                    text: qsTr("Return Home")
                    font.pointSize: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Button {
                    anchors.topMargin: 20
                    width: 100
                    height: 50
                    id: targetTrackingBtn
                    text: qsTr("Target Tracking")
                    font.pointSize: 10
                    onClicked: {
                        console.log("User clicked the target-tracking button");
                        var component = Qt.createComponent("TargetTracking.qml");
                        var ttView = component.createObject(rootLayout, {"x": 600, "y": 400});


                    }
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Button {
                    anchors.topMargin: 20
                    width: 100
                    height: 50
                    id: payloadControlBtn
                    onClicked: {
                        console.log("User clicked the payload controls button");
                        var component = Qt.createComponent("PayloadControls.qml");
                        var pcView = component.createObject(rootLayout, {"x": 600, "y": 400});

                    }
                    text: qsTr("Payload Control")
                    font.pointSize: 10
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Label {
                    anchors.topMargin: 20
                    width: 100
                    height: 50
                    id: messageText
                    text: qsTr("No messages yet")
                    font.pointSize: 10
                    color: "yellow"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Rectangle {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: messageText.bottom
                    anchors.topMargin: 30
                    id: commandRect
                    height: 400
                    width: 400
                    color: "green"
/*
                    Button {
                        anchors.top: parent.top
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Up")

                        onClicked: {

                            ROSController.sendCommand("(4.763f,5.3675f)");

                        }
                    }

                    Button {
                        anchors.left: parent.left
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Left")

                    }
                    Button {
                        anchors.right: parent.right
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Right")

                    }

                    Button {
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        text: qsTr("Down")

                    }
*/

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            var my_x = mouse.x * 0.025;
                            var my_y = 10.0 - (mouse.y * 0.025);
                            testLbl.text = qsTr("x: " + my_x + ", y:"+my_y);
                            ROSController.sendCommand("("+my_x+","+my_y+",3.82342)");
                        }
                    }
                }
                Label {
                    anchors.top: commandRect.bottom
                    color: "yellow"
                    id:testLbl
                    text: "no coords yet"
                }

            }
            Button {
                anchors.bottom: commandButtonsRect.bottom
                id: getMessageButton
                text: qsTr("Send Command")
                onClicked: {

                    ROSController.getMessage();

                }
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottomMargin: 20
            }

        }




    }







}
