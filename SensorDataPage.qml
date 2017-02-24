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
    property ChartView m_chart: splineChart1
    property Timer m_timer: chartTimer
    property SplineSeries m_series: splineSeries1
    //QStringList m_titles;
    property ValueAxis m_axis
    property ValueAxis m_axis_y
    property real m_step: 0.0
    property real m_x: 5.0
    property real m_y: 1.0
    width: 1200
    height: 900
    property alias label: label
    id:sensorDataPage
    Component.onCompleted: {
        m_series.append(m_x, m_y);
        m_axis = m_chart.axisX(m_series)
        m_axis.max = 10
        m_axis.min = 0
        //m_axis_y
        m_axis_y = m_chart.axisY(m_series)
        m_axis_y.max = 10
        m_axis_y.min = -5
        m_chart.setAxisX(m_axis, m_series);
//        m_chart.axisX(m_series).setRange(0,10)
//        m_chart.axisY(m_series).setRange(-5,10)

    }

    Timer {
        id: chartTimer
        interval: 500; running: true; repeat: true
        onTriggered: {

            var x = m_chart.plotArea.width / m_axis.tickCount;
            var y = (m_axis.max - m_axis.min) / m_axis.tickCount
            m_x += y;
            m_y = Math.random() % 5 - 2.5;
            m_series.append(m_x, m_y);
            m_chart.scrollRight(x, 0);
            if(m_x === 100){
                m_timer.stop();
            }




/*
            var x = 13.8;
            var y = Math.random() % 3 + 2;
            m_x += y;
            var m_y = Math.random() % 4;
            splineSeries1.append(m_x, m_y);
            splineChart1.scrollRight(x, 0);
//            splineSeries1e.append(m_x, m_y);
//            splineChart1e.scrollRight(x, 0);

            x = 25.1;
            y = Math.random() % 3 + 2;
            m_y = Math.random() %4;
            splineSeries2.append(m_x, m_y);
            splineChart2.scrollRight(x, 0);
//            splineSeries2e.append(m_x, m_y);
//            splineChart2e.scrollRight(x, 0);
*/

        }
    }

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
                text: qsTr("SENSOR DATA")
                font.pointSize: 28
                //color: "white"
                color: "#E0F2F1"


            }

        }

        Rectangle {
            id: dataChartRect
            anchors.top: titleRect.bottom
            anchors.topMargin: 40
            anchors.left: parent.left
            anchors.leftMargin: 50

            radius: 10
            width: parent.width * 0.7
            height: parent.height*0.75
            color: "#009688"

            /*
            Label {
                anchors.centerIn: parent
                id: camera
                text: qsTr("[SENSOR DATA VIEW HERE]")
                font.pointSize: 30
                color: "white"

            } */

            /*
            ListView {
                id: listView
                anchors.fill: parent
                topMargin: 25
                leftMargin: 22
                rightMargin: 25
                bottomMargin: 25
                model: ["sine1", "sine2"]
                delegate: ItemDelegate {
                    text: modelData
                    width: listView.width - listView.leftMargin - listView.rightMargin
                    height: graph.implicitHeight
                    topPadding: 50
                    Image {
                        id: graph
                        // NOTE: the dimensions for the graphs I chose were 800 width 200 height. if you decide to add any graphs keep the images at those dimensions to make things easier :)
                        source: "../Pictures/" + modelData + ".png"
                    }
                }


            } */
            StackView {
                id: chartStack
                anchors.fill: dataChartRect
                width: dataChartRect.width
                height: dataChartRect.height
                initialItem: defaultView

                // DEFAULT VIEW: SHOWING GRAPH THUMBNAILS
                Item {
                    id: defaultView

                    Label {
                        anchors.top: parent.top
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        anchors.topMargin: 5

                        id: chart1Label
                        text: qsTr("Chart 1")
                        font.pixelSize: 25
                        color: "#E0F2F1"

                    }

                    Rectangle {
                        id: chartRect1
                        width: parent.width * 0.95
                        height: parent.height * 0.33
                        color: "#009688"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: chart1Label.bottom
                        anchors.topMargin: 5


                        ChartView {
                            //title: "Sample Graph"
                            anchors.horizontalCenter: parent.horizontalCenter
                            id:splineChart1
                            anchors.fill: parent
                            legend.visible: false




                            SplineSeries {
                                //name: "SplineSeries"
                                id:splineSeries1
                                XYPoint { x: 0; y: 0.0 }
                                XYPoint { x: 1.1; y: 3.2 }
                                XYPoint { x: 1.9; y: 2.4 }
                                XYPoint { x: 2.1; y: 2.1 }
                                XYPoint { x: 2.9; y: 2.6 }
                                XYPoint { x: 3.4; y: 2.3 }
                                XYPoint { x: 4.1; y: 3.1 }
                            }

                        }

                        MouseArea {
                            property bool enlarged: false
                            width: parent.width
                            height: parent.height
                            anchors.fill: parent
                            // onClicked: chartStack.push(graph1)
                            onClicked: {
                                if(enlarged){
                                    parent.width *= 0.5
                                    parent.height *= 0.5

                                } else {
                                    parent.width *= 2
                                    parent.height *= 2

                                }

                                enlarged = !enlarged

                            }
                        }
                    }

                    Label {
                        anchors.top: chartRect1.bottom
                        anchors.left: parent.left
                        anchors.leftMargin: 30
                        anchors.topMargin: 10

                        id: chart2Label
                        text: qsTr("Chart 2")
                        font.pixelSize: 25
                        color: "#E0F2F1"

                    }

                    Rectangle {
                        id: chartRect2
                        width: parent.width * 0.95
                        height: parent.height * 0.33
                        color: "#009688"
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: chart2Label.bottom
                        anchors.topMargin: 5

                        ChartView {
                            //title: "Sample Graph"
                            anchors.horizontalCenter: parent.horizontalCenter
                            id:splineChart2
                            anchors.fill: parent
                            legend.visible: false




                            SplineSeries {
                                //name: "SplineSeries"
                                id:splineSeries2
                                color: "red"
                                width: 2
                                XYPoint { x: 0; y: 0.0 }
                                XYPoint { x: 1.1; y: 3.2 }
                                XYPoint { x: 1.9; y: 2.4 }
                                XYPoint { x: 2.1; y: 2.1 }
                                XYPoint { x: 2.9; y: 2.6 }
                                XYPoint { x: 3.4; y: 2.3 }
                                XYPoint { x: 4.1; y: 3.1 }
                            }

                        }

                        MouseArea {
                            anchors.fill: parent
                            width: parent.width
                            height: parent.height
                            onClicked: chartStack.push(graph2)

                        }
                    }
                }

                // expanded graph of first product
                Component {
                    id: graph1




                    Item {
                        id: graph1Item
                        property alias splineSeries1e: splineSeries1e




                        Timer {
                            interval: 500; running: true; repeat: true
                            onTriggered: {

                                var x = 13.8;
                                var y = Math.random() % 3 + 2;
                                m_x += y;
                                var m_y = Math.random() % 4;
                                splineSeries1e.append(m_x, m_y);
                                splineChart1e.scrollRight(x, 0);
                    //            splineSeries1e.append(m_x, m_y);
                    //            splineChart1e.scrollRight(x, 0);



                            }
                        }


                        ChartView {
                            title: "Chart 1"
                            anchors.horizontalCenter: parent.horizontalCenter
                            id:splineChart1e
                            anchors.fill: parent
                            legend.visible: false




                            SplineSeries {
                                name: "Chart 1"
                                id:splineSeries1e
                                XYPoint { x: 0; y: 0.0 }
                                XYPoint { x: 1.1; y: 3.2 }
                                XYPoint { x: 1.9; y: 2.4 }
                                XYPoint { x: 2.1; y: 2.1 }
                                XYPoint { x: 2.9; y: 2.6 }
                                XYPoint { x: 3.4; y: 2.3 }
                                XYPoint { x: 4.1; y: 3.1 }
                            }

                        }

                        MouseArea {
                            width: parent.width
                            height: parent.height
                            anchors.fill: parent
                            onClicked: chartStack.pop()
                        }
                    }
                }


                // expanded graph of second product
                Component {
                    id: graph2
                    Item {
                        id: graph2Item



                        Timer {
                            interval: 500; running: true; repeat: true
                            onTriggered: {

                                var x = 13.8;
                                var y = Math.random() % 3 + 2;
                                m_x += y;
                                var m_y = Math.random() % 4;
                                splineSeries2e.append(m_x, m_y);
                                splineChart2e.scrollRight(x, 0);
                    //            splineSeries1e.append(m_x, m_y);
                    //            splineChart1e.scrollRight(x, 0);



                            }
                        }


                        ChartView {
                            title: "Chart 2"
                            anchors.horizontalCenter: parent.horizontalCenter
                            id:splineChart2e
                            anchors.fill: parent
                            legend.visible: false



                            SplineSeries {
                                name: "Chart 2"
                                id:splineSeries2e
                                color: "red"
                                width: 2
                                XYPoint { x: 0; y: 0.0 }
                                XYPoint { x: 1.1; y: 3.2 }
                                XYPoint { x: 1.9; y: 2.4 }
                                XYPoint { x: 2.1; y: 2.1 }
                                XYPoint { x: 2.9; y: 2.6 }
                                XYPoint { x: 3.4; y: 2.3 }
                                XYPoint { x: 4.1; y: 3.1 }
                            }

                        }

                        MouseArea {
                            width: parent.width
                            height: parent.height
                            anchors.fill: parent
                            onClicked: chartStack.pop()
                        }

                    }
                }
            }


        }


        Rectangle {
            id:sensorTogglesRect
            anchors.top: titleRect.bottom
            anchors.topMargin: 40
            anchors.right: parent.right
            anchors.rightMargin: 50
            radius: 10
            width: parent.width * 0.7
            height: parent.height*0.75
            color: "#004D40"
            /*
            gradient: Gradient {
                GradientStop { position: 0.0; color: "black" }
                GradientStop { position: 1.0; color: "grey" }
            } */

            Button {
                id: option1
                text: qsTr("Sensor Option 1")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 25
                width: 240
                height: 75
                font.pixelSize: 20


            }

            Button {
                id: option2
                text: qsTr("Sensor Option 2")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: option1.bottom
                anchors.topMargin: 20
                width: 240
                height: 75
                font.pixelSize: 20
            }

            Button {
                id: option3
                text: qsTr("Sensor Option 3")
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: option2.bottom
                anchors.topMargin: 15
                width: 240
                height: 75
                font.pixelSize: 20
            }

        }

    }

}
