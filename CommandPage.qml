import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
import QtPositioning 5.6
import QtLocation 5.6
import "mapviewer"
GroundSystemLayout {
    id:rootLayout
    myVar: "hello command var"

//    Plugin {
//        id: osmPlugin
//        name: "osm"
//    }



    Dialog {
        id: cancelMissionDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: parent.width / 2
        height: parent.height/ 2
        parent: ApplicationWindow.overlay

        focus: true
        modal: true
        title: "Confirm Cancel Mission"
        standardButtons: Dialog.Ok

        contentItem: Rectangle {
            color: "#303030"
            implicitWidth: parent.width / 2
            implicitHeight: parent.height/ 2


            Label {
                id:selectColorLabel
                text: qsTr("Are you sure you want to cancel the current mission?")
                color: "white"
                font.pixelSize: 18
                font.bold: true
                anchors.centerIn: parent
            }

        }

    }


    Dialog {
        id: allWaypointsDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: parent.width / 2
        height: parent.height/ 2
        parent: ApplicationWindow.overlay

        focus: true
        modal: true
        title: "All Waypoints"
        standardButtons: Dialog.Ok | Dialog.Cancel

        contentItem: Rectangle {
            color: "#303030"
            implicitWidth: parent.width / 2
            implicitHeight: parent.height/ 2


            Label {
                id:waypointsTitleLabel
                text: qsTr("All Existing Waypoints")
                color: "white"
                font.pixelSize: 18
                font.bold: true
                anchors.centerIn: parent
            }

        }

    }


    Dialog {
        id: commandHelpDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: parent.width / 2
        height: parent.height/ 2
        parent: ApplicationWindow.overlay

        focus: true
        modal: true
        title: "Help"
        standardButtons: Dialog.Ok | Dialog.Cancel

        contentItem: Rectangle {
            color: "#303030"
            implicitWidth: parent.width / 2
            implicitHeight: parent.height/ 2


            Label {
                id:commandHelpDialogLabel
                text: qsTr("Command Help")
                color: "white"
                font.pixelSize: 18
                font.bold: true
                anchors.centerIn: parent
            }

        }

    }

    Dialog {
        id: immediateMoveDialog
        x: (parent.width - width) / 2
        y: (parent.height - height) / 2
        width: parent.width / 2
        height: parent.height * 0.75
        parent: ApplicationWindow.overlay

        focus: true
        modal: true
        title: "Immediate Goal"
        standardButtons: Dialog.Ok | Dialog.Cancel

        contentItem: Rectangle {
            id: immediateMoveDialogRootRect
            color: "#303030"
            implicitWidth: parent.width / 2
            implicitHeight: colLayout.height

            RowLayout {
                anchors.fill: parent

                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.333
                    color: immediateMoveDialogRootRect.color
                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.333
                    color: immediateMoveDialogRootRect.color



                    ColumnLayout {
                        anchors.fill: parent
                        id:colLayout



                        Rectangle {
                            anchors.horizontalCenter: parent.horizontalCenter
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height * 0.25
                            color: "#303030"

                            Label {
                                id:immediateMoveDialogLabel
                                text: qsTr("Set Immediate Goal")
                                color: "white"
                                font.pixelSize: 18
                                font.bold: true
                                anchors.centerIn: parent
                            }
                        }

                        Rectangle {
                            anchors.horizontalCenter: parent.horizontalCenter
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height * 0.25
                            color: "#303030"
                            TextField {
                                placeholderText: qsTr("latitude")
                            }
                        }

                        Rectangle {
                            anchors.horizontalCenter: parent.horizontalCenter
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height * 0.25
                            color: "#303030"
                            TextField {
                                placeholderText: qsTr("longitude")
                            }
                        }


                        Rectangle {
                            anchors.horizontalCenter: parent.horizontalCenter
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height * 0.25
                            color: "#303030"
                            TextField {
                                placeholderText: qsTr("altitude")
                            }
                        }


                    }


                }
                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredWidth: parent.width * 0.333
                    color: immediateMoveDialogRootRect.color
                }

            }



        }

    }

    RowLayout {
        anchors.fill: parent

        Rectangle {
            id: leftCol
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.2
            color: rootLayout.colors["dark"]


            ColumnLayout {
                anchors.fill: parent

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.333
                    color: leftCol.color

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 30
                        anchors.centerIn: parent
                        color: rootLayout.colors["xlight"]
                        radius: 20
                        border.color: rootLayout.colors["dark"]
                        border.width: 5

                        Image {
                            id: targetIcon
                            source: "png/earth-globe.png"
                            anchors.centerIn: parent
                            height: parent.height * 0.7
                            width: parent.height * 0.7
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                allWaypointsDialog.open();
                            }
                        }
                    }



                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.333
                    color: leftCol.color

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 30
                        anchors.centerIn: parent
                        color: rootLayout.colors["xlight"]
                        radius: 20
                        border.color: rootLayout.colors["dark"]
                        border.width: 5


                        Image {
                            id: listIcon
                            source: "png/bull-horn-announcer.png"
                            anchors.centerIn: parent
                            height: parent.height * 0.7
                            width: parent.height * 0.7
                        }
                    }

                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.333
                    color: leftCol.color



                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 30
                        anchors.centerIn: parent
                        color: rootLayout.colors["xlight"]
                        radius: 20
                        border.color: rootLayout.colors["dark"]
                        border.width: 5


                        Image {
                            id: cancelIcon
                            source: "png/remove-button.png"
                            anchors.centerIn: parent
                            height: parent.height * 0.7
                            width: parent.height * 0.7
                        }
                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                cancelMissionDialog.open();
                            }
                        }
                    }

                }

            }



        }
        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.6
            color: rootLayout.colors["neutral"]




//            Map {
//                anchors.fill: parent
//                plugin: osmPlugin
//                center: QtPositioning.coordinate(59.91, 10.75) // Oslo
//                zoomLevel: 10
//                anchors.margins: 10
//            }

//            mapviewer {

//            }

        }
        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.2
            color: rootLayout.colors["dark"]
            id: rightCol


            ColumnLayout {
                anchors.fill: parent

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.333
                    color: rightCol.color

                    Rectangle {
                        property bool pressed: false
                        id: pushPinRect
                        anchors.fill: parent
                        anchors.margins: 30
                        anchors.centerIn: parent
                        color: rootLayout.colors["xlight"]
                        radius: 20
                        border.color: rootLayout.colors["dark"]
                        border.width: 5

                        Image {
                            id: waypointIcon
                            source: "png/paper-push-pin.png"
                            anchors.centerIn: parent
                            height: parent.height * 0.7
                            width: parent.height * 0.7
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            pushPinRect.pressed = !pushPinRect.pressed;
                            if(pushPinRect.pressed){
                                pushPinRect.color = rootLayout.colors["light"];
                            } else {
                                pushPinRect.color = rootLayout.colors["xlight"];
                            }
                        }
                    }



                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.333
                    color: leftCol.color

                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 30
                        anchors.centerIn: parent
                        color: rootLayout.colors["xlight"]
                        radius: 20
                        border.color: rootLayout.colors["dark"]
                        border.width: 5


                        Image {
                            id: customGoalIcon
                            source: "png/move-option.png"
                            anchors.centerIn: parent
                            height: parent.height * 0.7
                            width: parent.height * 0.7
                        }


                        MouseArea {
                            anchors.fill: parent
                            onClicked: immediateMoveDialog.open()
                        }
                    }

                }

                Rectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: parent.height * 0.333
                    color: leftCol.color



                    Rectangle {
                        anchors.fill: parent
                        anchors.margins: 30
                        anchors.centerIn: parent
                        color: rootLayout.colors["xlight"]
                        radius: 20
                        border.color: rootLayout.colors["dark"]
                        border.width: 5


                        Image {
                            id: helpIcon
                            source: "png/question-sign.png"
                            anchors.centerIn: parent
                            height: parent.height * 0.7
                            width: parent.height * 0.7
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                commandHelpDialog.open();
                            }
                        }
                    }

                }

            }


        }

    }
}
