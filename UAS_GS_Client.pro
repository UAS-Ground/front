QT += qml quick quickcontrols2

CONFIG += c++11

SOURCES +=

RESOURCES += qml.qrc \
    mapviewer.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android


#android {
#    target.path = /libs/armeabi-v7a
#    export(target.path)
#    INSTALLS += target
#    export(INSTALLS)

#    ANDROID_EXTRA_LIBS = \
#        $$(ANDROID_STANDALONE_TOOLCHAIN)/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_core.so \
#        $$(ANDROID_STANDALONE_TOOLCHAIN)/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_imgproc.so \
#        $$(ANDROID_STANDALONE_TOOLCHAIN)/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_imgcodecs.so \
#        $$(ANDROID_STANDALONE_TOOLCHAIN)/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_videoio.so \
#        $$(ANDROID_STANDALONE_TOOLCHAIN)/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libopencv_highgui.so \
#        $$(ANDROID_STANDALONE_TOOLCHAIN)/sysroot/usr/share/opencv/sdk/native/libs/armeabi-v7a/libnative_camera_r4.4.0.so \ #Adapt this line to your device's Android version
#        $$[QT_INSTALL_QML]/CVCamera/libcvcameraplugin.so

#    ANDROID_PERMISSIONS += \
#        android.permission.CAMERA

#    ANDROID_FEATURES += \
#        android.hardware.camera
#}

