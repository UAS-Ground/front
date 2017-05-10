/*
 * Copyright (C) 2014 EPFL
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see http://www.gnu.org/licenses/.
 */

/**
 * @file cvcamera.cpp
 * @brief Implementation of the QML wrapper for OpenCV camera access
 * @author Ayberk Özgür
 * @version 1.0
 * @date 2014-09-22
 */

#include"CVCamera.h"

CVCamera::CVCamera(QQuickItem* parent) :
    QQuickItem(parent)
{
    //Build the list of available devices
    QList<QCameraInfo> cameras = QCameraInfo::availableCameras();
    for(const auto& cameraInfo : cameras){
        QString device;
        device += cameraInfo.deviceName();
        device += " - ";
        device += cameraInfo.description();
        deviceList << device;
    }
    emit deviceListChanged();
    if(this->rosCameraActive)
    {
        std::cout << "in CVCamera::CVCamera()... rosCameraActive is TRUE!\n";
        size = QSize(320,240);

    }
    else
    {
        std::cout << "in CVCamera::CVCamera()... rosCameraActive is FALSE!\n";
        size = QSize(640,480);

    }
    connect(this, &QQuickItem::parentChanged, this, &CVCamera::changeParent);

    //Open camera right away
    update();
}

CVCamera::~CVCamera()
{
    if(thread)
        thread->stop();
    delete thread;
    delete camera;
    //Camera release is automatic when cv::VideoCapture is destroyed
}

void CVCamera::changeParent(QQuickItem* parent)
{
    //FIXME: we probably need to disconnect the previous parent
    //TODO: probably a good idea to stop the camera (and restart it if we are auto-starting in this context)
}

int CVCamera::getDevice() const
{
    return device;
}

void CVCamera::setDevice(int device)
{
    if(device >= 0 && this->device != device){
        this->device = device;
        update();
    }
}

QSize CVCamera::getSize() const
{
    return size;
}

void CVCamera::setSize(QSize size)
{
    if(this->size.width() != size.width() || this->size.height() != size.height()){
        this->size = size;
        update();
        emit sizeChanged();
    }
}

QVariant CVCamera::getCvImage()
{
    if(!exportCvImage){
        exportCvImage = true;
        update();
    }
    QVariant container(QVariant::UserType);
    container.setValue(cvImage);
    return container;
}

QStringList CVCamera::getDeviceList() const
{
    return deviceList;
}

void CVCamera::allocateCvImage()
{
    cvImage.release();
    delete[] cvImageBuf;
#ifdef ANDROID
    cvImageBuf = new unsigned char[size.width()*size.height()*3/2];
    cvImage = cv::Mat(size.height()*3/2,size.width(),CV_8UC1,cvImageBuf);
#else
    cvImageBuf = new unsigned char[size.width()*size.height()*3];
    cvImage = cv::Mat(size.height(),size.width(),CV_8UC3,cvImageBuf);
#endif
}

void CVCamera::allocateVideoFrame()
{
#ifdef ANDROID
    videoFrame = new QVideoFrame(size.width()*size.height()*3/2,size,size.width(),VIDEO_OUTPUT_FORMAT);
#else
    videoFrame = new QVideoFrame(size.width()*size.height()*4,size,size.width()*4,VIDEO_OUTPUT_FORMAT);
#endif
}

void CVCamera::update()
{
    printf("Opening camera %d, width: %d, height: %d", device, size.width(), size.height());
    DPRINT("Opening camera %d, width: %d, height: %d", device, size.width(), size.height());

    //Destroy old thread, camera accessor and buffers
    delete thread;
    delete camera;
    if(videoFrame && videoFrame->isMapped())
        videoFrame->unmap();
    delete videoFrame;
    videoFrame = NULL;
    delete[] cvImageBuf;
    cvImageBuf = NULL;

    //Create new buffers, camera accessor and thread
    if(exportCvImage)
        allocateCvImage();
    if(videoSurface)
        allocateVideoFrame();
    camera = new BetterVideoCapture();
    thread = new CameraThread(
        camera,videoFrame,
        cvImageBuf,
        size.width(),
        size.height(), 
        &(this->brightness), 
        &(this->contrast), 
        &(this->objectDetectionActive),
        &(this->licenseDetectionActive),
        &(this->eyesDetectionActive),
        &(this->rosCameraActive)
        );
    connect(thread,SIGNAL(imageReady()), this, SLOT(imageReceived()));

    //Open newly created device
    try{
        if(camera->open(device)){
            camera->setProperty(CV_CAP_PROP_FRAME_WIDTH,size.width());
            camera->setProperty(CV_CAP_PROP_FRAME_HEIGHT,size.height());
            if(videoSurface){
                if(videoSurface->isActive())
                    videoSurface->stop();
                if(!videoSurface->start(QVideoSurfaceFormat(size,VIDEO_OUTPUT_FORMAT)))
                    DPRINT("Could not start QAbstractVideoSurface, error: %d",videoSurface->error());
            }
            thread->start();
            DPRINT("Opened camera %d",device);
        }
        else
            DPRINT("Could not open camera %d",device);
    }
    catch(int e){
        DPRINT("Exception %d",e);
    }
}

void CVCamera::imageReceived()
{
    std::cout << "in CVCamera::imageReceived()...\n";
    //Update VideoOutput
    if(videoSurface)
    {
        std::cout << "in CVCamera::imageReceived(), videoSurface is NOT NULL\n";
        if(!videoSurface->present(*videoFrame))
        {
            std::cout << "in CVCamera::imageReceived(), Some error in videoSurface->present(*videoFrame)\n";
            DPRINT("Could not present QVideoFrame to QAbstractVideoSurface, error: %d",videoSurface->error());
        }
        else
        {
            std::cout << "in CVCamera::imageReceived(), videoSurface->present(*videoFrame) was successful\n";

        }
    }
    else
    {
        std::cout << "in CVCamera::imageReceived(), videoSurface is NULL\n";

    }

    //Update exported CV image
    if(exportCvImage){
        emit cvImageChanged();
    }
}

QAbstractVideoSurface* CVCamera::getVideoSurface() const
{
    return videoSurface;
}

void CVCamera::setVideoSurface(QAbstractVideoSurface* surface)
{
    if(videoSurface != surface){
        videoSurface = surface;
        update();
    }
}

void CVCamera::myMcFunction(QString funk)
{
    std::cout << "MYMCFUNCTION WAS CALLED!";
}

void CVCamera::setBrightness(int brightness)
{
    qDebug() << "in CVCamera::setBrightness(" << brightness << ")";
    this->brightness = brightness;
}
void CVCamera::setContrast(float contrast)
{
    qDebug() << "in CVCamera::setContrast(" << contrast << ")";
    this->contrast = contrast;
}
//bool * licenseDetectionActive
void CVCamera::toggleObjectDetection()
{
    this->objectDetectionActive = !this->objectDetectionActive;
}
void CVCamera::toggleBodyDetection()
{
    this->licenseDetectionActive = !this->licenseDetectionActive;
}
void CVCamera::toggleEyesDetection()
{
    this->eyesDetectionActive = !this->eyesDetectionActive;
}
// /
void CVCamera::toggleROSCamera()
{
    this->rosCameraActive = !this->rosCameraActive;
}