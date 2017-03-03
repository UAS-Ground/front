import QtQuick 2.6
import QtQuick.Controls 1.4
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.0
import QtQuick.Dialogs 1.2
import QtPositioning 5.5
import QtLocation 5.6
import QtQuick.Window 2.0

Item {
    width: Screen.desktopAvailableWidth
    height: Screen.desktopAvailableHeight
    property alias label: label
    id:commandPage
    Keys.enabled: true
    visible: true

    property int dronex: 0
    property int droney: 0
    property int dronez: 0


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
            //color: "#00695C"
            color: "#004D40"

            /*
            gradient: Gradient {
                GradientStop { position: 0.0; color: "black" }
                GradientStop { position: 1.0; color: "grey" }
            } */

            Label {
                anchors.centerIn: parent
                id: label
                text: qsTr("COMMAND")
                font.pointSize: 28
                //color: "#64FFDA"
                color: "white"

            }

        }

        Rectangle {

            id: optionsRect
            anchors.top: titleRect.bottom
            anchors.topMargin: 40
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.left: parent.left
            anchors.leftMargin: 50

            radius: 10
            width: parent.width * 0.7
            height: parent.height*0.75
            /*
            gradient: Gradient {
                GradientStop { position: 0.0; color: "grey" }
                GradientStop { position: 1.0; color: "black" }
            } */
            color: "#009688"

            StackView {
                id: commandStack
                anchors.fill: parent
                width: parent.width
                height: parent.height
                initialItem: defaultpane


                Item {
                    id: defaultpane
                    Label {
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.verticalCenter: parent.verticalCenter
                        text: qsTr("Select an option")
                        color: "#00695C"
                        font.pixelSize: 40

                    }
                }


                Component {
                    id: homepane
                    Item {
                        Button {
                            text: qsTr("Back")
                            anchors.top: parent.top
                            anchors.topMargin: 20
                            anchors.left: parent.left
                            anchors.leftMargin: 20
                            width: 120
                            height: 37
                            font.pixelSize: 15
                            onClicked: commandStack.pop()
                        }


                        Rectangle  {
                            id: mapblock
                            width: parent.width * 0.8
                            height: parent.height * 0.6
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: parent.top
                            anchors.topMargin: 75

                            color: "#004D40"
                           MouseArea {
                              anchors.fill: parent
                           }
                        }

                        Text {
                            id: cmdlabel
                            text: qsTr("CURRENT HOME POINT: [X , X , X]\nClick map to set new home point")
                            color: "white"
                            anchors.horizontalCenter: parent.horizontalCenter
                            font.pixelSize: 17
                            anchors.top: mapblock.bottom
                            anchors.topMargin: 20
                        }

                        Button {
                            text: qsTr("Confirm Home Point")
                            anchors.horizontalCenter: parent.horizontalCenter
                            anchors.top: cmdlabel.bottom
                            anchors.topMargin: 10
                            width: 150
                            height: 50
                            font.pixelSize: 13
                        }
                    }
                }


            }



            Label {
                id: coords
                font.pixelSize: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 40
                anchors.horizontalCenter: parent.horizontalCenter

                text: qsTr("CURRENT POSITION: (" + dronex + ", " + droney + ", " + dronez + ")")
                color: "white"

            }

            Label {
                //focus: true
                id: vel
                font.pixelSize: 20
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 15
                anchors.horizontalCenter: parent.horizontalCenter

                text: qsTr("CURRENT VELOCITY: 0")
                color: "white"

            }

        }


        Rectangle {
            id:commandButtonsRect
            anchors.top: titleRect.bottom
            anchors.topMargin: 40
            //anchors.horizontalCenter: parent.horizontalCenter
            anchors.right: parent.right
            anchors.rightMargin: 50
            radius: 10
            width: parent.width * 0.7
            height: parent.height*0.75
            /*
            gradient: Gradient {
                GradientStop { position: 0.0; color: "black" }
                GradientStop { position: 1.0; color: "grey" }
            }
            */
            color: "#004D40"
                Button {
                    id: gohome
                    text: qsTr("Return Home")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: parent.top
                    anchors.topMargin: 25
                    width: 240
                    height: 75
                    font.pixelSize: 20
                    onClicked: commandStack.push(homepane)


                }

                Button {
                    id: targetTracking
                    text: qsTr("Option 2")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: gohome.bottom
                    anchors.topMargin: 20
                    width: 240
                    height: 75
                    font.pixelSize: 20
                }

                Button {
                    text: qsTr("Option 3")
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.top: targetTracking.bottom
                    anchors.topMargin: 15
                    width: 240
                    height: 75
                    font.pixelSize: 20
                }

            }

        }

    }

