import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0

Item {
    visible: true
    width: 1200
    height: 900
    //title: qsTr("UAS Ground System")
    id: window
    Keys.enabled: true


    Connections {
        target: ROSController

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
        width: 1200
        height: 900
        anchors.fill: parent
        color: "#B2DFDB"
        id:swipeViewContainer


        SwipeView {
            id: swipeView
            anchors.fill: parent
            currentIndex: tabBar.currentIndex


            CommandPage {

            }

            MappingPage {

            }

            MachineHealthPage {

            }
        }

    }


    TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        TabButton {
            text: qsTr("Command")
        }
        TabButton {
            text: qsTr("Environment")
        }
        TabButton {
            text: qsTr("Machine Health")
        }
    }

}
