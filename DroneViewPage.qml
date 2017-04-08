import QtQuick 2.7
import QtQuick.Controls 2.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Layouts 1.1
//import CVCamera 1.0;
import QtMultimedia 5.5

GroundSystemLayout {
    id:rootLayout
    myVar: "hello var"


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
                            source: "png/bullseye.png"
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
                            id: listIcon
                            source: "png/tasks-list.png"
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
                            source: "png/trash.png"
                            anchors.centerIn: parent
                            height: parent.height * 0.7
                            width: parent.height * 0.7
                        }
                    }

                }

            }

        }
        Rectangle {
            Layout.fillHeight: true
            Layout.preferredWidth: parent.width * 0.6
            color: rootLayout.colors["neutral"]


            Rectangle {
                anchors.centerIn: parent
                width: parent.width
                height: width * 3/4
                color: rootLayout.colors["dark"]
                radius: 20

//            Rectangle {
//                anchors.centerIn: parent
//                width: 690
//                height: 530
//                color: rootLayout.colors["dark"]
//                radius: 20


//                CVCamera {
//                    id: camera
//                    device: deviceBox.currentIndex
//                    size: "640x480"
//                    anchors.centerIn: parent
//                }

                Camera {
                    id: camera
                }

                VideoOutput {
                    anchors.top: camera.top
                    id: output
                    source: camera
                    anchors.fill: parent
                    anchors.margins: 10
                    anchors.centerIn: parent
                }

//                VideoOutput {
//                    anchors.top: camera.top
//                    id: output
//                    source: camera
//                    anchors.centerIn: parent
//                }

//                ComboBox {
//                    id: deviceBox
//                    width: 200
//                    anchors.top: output.bottom
//                    anchors.horizontalCenter: output.horizontalCenter
//                    model: camera.deviceList
//                }
            }



        }
        Rectangle {
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


                        Dial {
                            id: brightnessDial
                            anchors.centerIn: parent
                            height: parent.height * 0.7
                            width: parent.height * 0.7
                            property bool animate: true

                            Behavior on value {
                                enabled: true
                                NumberAnimation {
                                    duration: 100
                                    easing.type: Easing.OutCirc
                                }
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



                        Dial {
                            id: contrastDial
                            height: parent.height * 0.7
                            width: parent.height * 0.7
                            anchors.centerIn: parent
                            property bool animate: true


                            Behavior on value {
                                enabled: true
                                NumberAnimation {
                                    duration: 100
                                    easing.type: Easing.OutCirc
                                }

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
                            id: faceIcon
                            source: "png/camera-retro.png"
                            anchors.centerIn: parent
                            height: parent.height * 0.7
                            width: parent.height * 0.7
                        }
                    }

                }

            }

        }

    }
}
