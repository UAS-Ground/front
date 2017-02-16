import QtQuick 2.4
import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtCharts 2.0


Item {
    width: 1200
    height: 900
    id: rootItem
    Keys.enabled: true


    ColumnLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 20
        anchors.top: parent.top
        anchors.fill: parent
        anchors.bottomMargin: 20
        id:rootLayout
        width: 1200
        height: 900

        Connections {
            target: ROSController


            onMessageReceived: {
                messageText.text = message;
                /*var vals = message.split(",");
                var x = parseInt(vals[0].trim()) * 8.2;
                var y = parseInt(vals[1].trim()) * 8.2;
                fuelGauge.value = y;
                xGauge.value = x*/
                var x = parseFloat(message) * 25.3;
                fuelGauge.value = x;
                xGauge.value = x

                //console.log("got x: " + x + " and y: " + y);

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
            anchors.topMargin: 20
            anchors.bottomMargin: 20
            anchors.top: parent.top
            anchors.horizontalCenter: parent.horizontalCenter
            id: titleRect
            width: 300
            height: 100
            radius: 10

            color: "#009688"
            /*gradient: Gradient {
                GradientStop {
                    position: 0.0
                    color: "#ffffff"
                }
                GradientStop {
                    position: 1.0
                    color: "grey"
                }
            }*/

            Label {
                anchors.centerIn: parent
                id: label
                text: qsTr("Machine Health")
                font.pointSize: 28
                color: "white"
            }
        }

        RowLayout {
            anchors.top: titleRect.bottom
            anchors.topMargin: 20
            width: parent.width
            height: parent.height * 0.8

            Rectangle {
                border.color: "black"
                anchors.left: parent.left
                height: parent.height * 0.75
                width: parent.width / 2
                id: overallHealthRect

                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#009688" }
                    GradientStop { position: 1.0; color: "#004D40" }
                }

                RowLayout {
                    id:gaugeLayout
                    anchors.centerIn: parent
                    Gauge {
                        minimumValue: 0
                        value: 50
                        maximumValue: 100
                        anchors.verticalCenter: parent.verticalCenter
                        id: fuelGauge

                        Behavior on value {
                            NumberAnimation {
                                duration: 1000
                            }
                        }

                    }
                    CircularGauge {
                        anchors.verticalCenter: parent.verticalCenter
                        id:xGauge
                        height: fuelGauge.height
                        anchors.leftMargin: 20

                        Behavior on value {
                            NumberAnimation {
                                duration: 1000
                            }
                        }

                        style: CircularGaugeStyle {
                            needle: Rectangle {
                                y: outerRadius * 0.15
                                implicitWidth: outerRadius * 0.03
                                implicitHeight: outerRadius * 0.9
                                antialiasing: true
                                color: Qt.rgba(0.66, 0.3, 0, 1)
                            }
                        }
                    }



                }


                Label {
                    anchors.topMargin: 20
                    anchors.top: gaugeLayout.bottom
                    width: 100
                    height: 50
                    id: messageText
                    text: qsTr("No messages yet")
                    font.pointSize: 10
                    color: "yellow"
                    anchors.horizontalCenter: parent.horizontalCenter
                }
            }
            Rectangle {
                anchors.left: overallHealthRect.right
                border.color: "black"
                height: parent.height * 0.75
                width: parent.width / 2
                id:plHealthBtnRect

                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#009688" }
                    GradientStop { position: 1.0; color: "#004D40" }
                }

                ColumnLayout {
                    anchors.top: plHealthBtnRect.top
                    anchors.topMargin: 20
                    anchors.centerIn: parent



                    Button {
                        anchors.topMargin: 20
                        width: 100
                        height: 50
                        text: qsTr("Payload 1 Health")
                        id: payloadHealth1Btn
                        font.pointSize: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {

                            console.log("User clicked the Payload 1's button");
                            var component = Qt.createComponent("PayloadHealth.qml");
                            var plhView = component.createObject(rootLayout, {"x": 600, "y": 400});
                        }
                    }

                    Button {
                        anchors.topMargin: 20
                        width: 100
                        height: 50
                        id: payloadHealth2Btn
                        text: qsTr("Payload 2 Health")
                        font.pointSize: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            if(fuelGauge.value > 50){
                               fuelGauge.value = 20;
                            } else {
                                fuelGauge.value = 80;
                            }
                        }
                    }

                    Button {
                        anchors.topMargin: 20
                        width: 100
                        height: 50
                        id: payloadHealth3Btn
                        text: qsTr("Payload 3 Health")
                        font.pointSize: 10
                        anchors.horizontalCenter: parent.horizontalCenter
                        onClicked: {
                            console.log("User clicked the Payload 3's button");

                            ROSController.runGraph();
                        }
                    }

                }
            }
        }
    }
}



