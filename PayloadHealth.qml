import QtQuick 2.7
import QtQuick.Controls 1.2
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Extras 1.4
import QtCharts 2.2


Item {
    property var m_x: 0.0
    Dialog {
        visible: true
        title: "Payload Health"

        Connections {
            target: ROSController


            onMessageReceived: {
                console.log('in PayloadHealth onMessageReceived...');
                // var messagePieces = message.split(',');
                // var x = parseFloat(messagePieces[0]);
                // var y = parseFloat(messagePieces[1]);
                // var z = parseFloat(messagePieces[2]);
                var x = parseFloat(message) * 25.3;

                console.log('I parsed ' + x + ' from ' + message);
                //messageText.text = message
                testGauge.value = x;




            }
        }


        Timer {
            interval: 500; running: true; repeat: true
            onTriggered: {

                var x = splineChart.plotArea.width / 6;
                var y = Math.random() % 3 + 2;
                m_x += y;
                var m_y = Math.random() % 5 - 2.5;
                splineSeries.append(m_x, m_y);
                splineChart.scrollRight(x, 0);
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

        contentItem: Rectangle {
            color: "grey"
            implicitWidth: 600
            implicitHeight: 400

            ColumnLayout {
                anchors.fill: parent
                width: parent.implicitWidth

                Label {
                    font.pointSize: 30
                    text: qsTr("Payload Health")
                    anchors.horizontalCenter: parent.horizontalCenter
                }
//                CircularGauge {
//                    id: testGauge
//                    anchors.horizontalCenter: parent.horizontalCenter

//                    Behavior on value {
//                        NumberAnimation {
//                            duration: 1000
//                        }
//                    }

//                    style: CircularGaugeStyle {
//                        needle: Rectangle {
//                            y: outerRadius * 0.15
//                            implicitWidth: outerRadius * 0.03
//                            implicitHeight: outerRadius * 0.9
//                            antialiasing: true
//                            color: Qt.rgba(0.66, 0.3, 0, 1)
//                        }
//                    }
//                }


                ChartView {
                      title: "Spline"
                      anchors.horizontalCenter: parent.horizontalCenter
                      anchors.fill: parent
                      id:splineChart

                      SplineSeries {
                          name: "SplineSeries"
                          id:splineSeries
                          XYPoint { x: 0; y: 0.0 }
                          XYPoint { x: 1.1; y: 3.2 }
                          XYPoint { x: 1.9; y: 2.4 }
                          XYPoint { x: 2.1; y: 2.1 }
                          XYPoint { x: 2.9; y: 2.6 }
                          XYPoint { x: 3.4; y: 2.3 }
                          XYPoint { x: 4.1; y: 3.1 }
                      }
                  }

//                Image {
//                    anchors.horizontalCenter: parent.horizontalCenter
//                    id: image
//                    width: 100
//                    height: 100
//                    source: "indicator.png"
//                }


            }

        }
    }

}
