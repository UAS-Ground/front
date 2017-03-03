
#include "roscontroller.h"
#include <QDebug>
#include <cstring>
#include <cstdio>
#include <QHostInfo>
#include <QDataStream>
void ROSController::startListening()
{

}

void ROSController::sendKeyPress(int key){
    qDebug() << "User sent key " << key;
    QString cmd = "" + key;
    this->sendCommand(cmd);
}

void ROSController::runGraph(){
    system("/home/tyler/ground_system/graph/graph");
}

ROSController::ROSController(QObject * parent) : QObject(parent)
{

    udpSocket = new QUdpSocket(this);
    udpSocket->bind(QHostAddress::LocalHost, 7755);

    connect(udpSocket, SIGNAL(readyRead()), this, SLOT(readyRead()));
    qDebug() << "udpSocket is live...";

    tcpSocket = new QTcpSocket(this);
    networkSession = Q_NULLPTR;

    //QString LOCAL_HOST = QHostInfo::localHostName();
    QString LOCAL_HOST = "127.0.0.1";
    qDebug() << "in ROSController() want to connect to " << LOCAL_HOST;


    tcpSocket->connectToHost(LOCAL_HOST, 8080);

}


void ROSController::startTracker()
{
    system("./home/tyler/front/ObjectTracker/objectTracking2");
}

ROSController::~ROSController()
{
    udpSocket->close();
    tcpSocket->close();
}


void ROSController::getMessage()
{
    emit messageReceived("No messages received");
}

void ROSController::sendCommand(QString cmd)
{


    qDebug() << "in sendCommand() with message " << cmd;
    QByteArray block;
    block.append(cmd);
    tcpSocket->write(block);
}


void ROSController::readyRead()
{
    //qDebug() << "In readyRead()...";
    // when data comes in
    QByteArray buffer;
    buffer.resize(udpSocket->pendingDatagramSize());

    QHostAddress sender;
    quint16 senderPort;

    udpSocket->readDatagram(buffer.data(), buffer.size(), &sender, &senderPort);


    emit messageReceived(buffer);
}

void ROSController::readPendingDatagrams()
{
    while (udpSocket->hasPendingDatagrams()) {
        QByteArray datagram;
        datagram.resize(udpSocket->pendingDatagramSize());
        QHostAddress sender;
        quint16 senderPort;

        udpSocket->readDatagram(datagram.data(), datagram.size(),
                               &sender, &senderPort);

        printf("%s\n",datagram.data());
        emit messageReceived("This is a blank message");
    }
}

