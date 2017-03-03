import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Window 2.0

Item {
    visible: true
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight


     Rectangle {
        width: parent.width
        height: parent.height
        //color: "white"
        //color: "#B2DFDB"
        color: "#80CBC4"

        SwipeView {
            id: swipeView
            anchors.fill: parent
            currentIndex: tabBar.currentIndex

            CommandPage {
            }

            DroneViewPage {
            }

            SensorDataPage {
            }

            MachineHealthPage {

            }
         }
     }

     TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex
        width: parent.width
        anchors.bottom: parent.bottom
        TabButton {
            text: qsTr("Command")
        }
        TabButton {
            text: qsTr("DroneView")
        }
        TabButton{
            text: qsTr("Sensor Data")
        }
        TabButton {
            text: qsTr("Machine Health")
        }
    }
}
