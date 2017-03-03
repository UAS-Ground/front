/****************************************************************************
** Meta object code from reading C++ file 'CVCamera.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.8.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../src/CVCamera.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'CVCamera.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.8.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_CVCamera_t {
    QByteArrayData data[22];
    char stringdata0[254];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_CVCamera_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_CVCamera_t qt_meta_stringdata_CVCamera = {
    {
QT_MOC_LITERAL(0, 0, 8), // "CVCamera"
QT_MOC_LITERAL(1, 9, 11), // "sizeChanged"
QT_MOC_LITERAL(2, 21, 0), // ""
QT_MOC_LITERAL(3, 22, 17), // "deviceListChanged"
QT_MOC_LITERAL(4, 40, 14), // "cvImageChanged"
QT_MOC_LITERAL(5, 55, 21), // "toggleObjectDetection"
QT_MOC_LITERAL(6, 77, 11), // "setContrast"
QT_MOC_LITERAL(7, 89, 8), // "contrast"
QT_MOC_LITERAL(8, 98, 13), // "setBrightness"
QT_MOC_LITERAL(9, 112, 10), // "brightness"
QT_MOC_LITERAL(10, 123, 12), // "myMcFunction"
QT_MOC_LITERAL(11, 136, 4), // "funk"
QT_MOC_LITERAL(12, 141, 12), // "changeParent"
QT_MOC_LITERAL(13, 154, 11), // "QQuickItem*"
QT_MOC_LITERAL(14, 166, 6), // "parent"
QT_MOC_LITERAL(15, 173, 13), // "imageReceived"
QT_MOC_LITERAL(16, 187, 6), // "device"
QT_MOC_LITERAL(17, 194, 12), // "videoSurface"
QT_MOC_LITERAL(18, 207, 22), // "QAbstractVideoSurface*"
QT_MOC_LITERAL(19, 230, 4), // "size"
QT_MOC_LITERAL(20, 235, 10), // "deviceList"
QT_MOC_LITERAL(21, 246, 7) // "cvImage"

    },
    "CVCamera\0sizeChanged\0\0deviceListChanged\0"
    "cvImageChanged\0toggleObjectDetection\0"
    "setContrast\0contrast\0setBrightness\0"
    "brightness\0myMcFunction\0funk\0changeParent\0"
    "QQuickItem*\0parent\0imageReceived\0"
    "device\0videoSurface\0QAbstractVideoSurface*\0"
    "size\0deviceList\0cvImage"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_CVCamera[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       9,   14, // methods
       5,   76, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   59,    2, 0x06 /* Public */,
       3,    0,   60,    2, 0x06 /* Public */,
       4,    0,   61,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       5,    0,   62,    2, 0x0a /* Public */,
       6,    1,   63,    2, 0x0a /* Public */,
       8,    1,   66,    2, 0x0a /* Public */,
      10,    1,   69,    2, 0x0a /* Public */,
      12,    1,   72,    2, 0x0a /* Public */,
      15,    0,   75,    2, 0x08 /* Private */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // slots: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::Float,    7,
    QMetaType::Void, QMetaType::Int,    9,
    QMetaType::Void, QMetaType::QString,   11,
    QMetaType::Void, 0x80000000 | 13,   14,
    QMetaType::Void,

 // properties: name, type, flags
      16, QMetaType::Int, 0x00095103,
      17, 0x80000000 | 18, 0x0009510b,
      19, QMetaType::QSize, 0x00495103,
      20, QMetaType::QStringList, 0x00495001,
      21, QMetaType::QVariant, 0x00495001,

 // properties: notify_signal_id
       0,
       0,
       0,
       1,
       2,

       0        // eod
};

void CVCamera::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        CVCamera *_t = static_cast<CVCamera *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->sizeChanged(); break;
        case 1: _t->deviceListChanged(); break;
        case 2: _t->cvImageChanged(); break;
        case 3: _t->toggleObjectDetection(); break;
        case 4: _t->setContrast((*reinterpret_cast< float(*)>(_a[1]))); break;
        case 5: _t->setBrightness((*reinterpret_cast< int(*)>(_a[1]))); break;
        case 6: _t->myMcFunction((*reinterpret_cast< QString(*)>(_a[1]))); break;
        case 7: _t->changeParent((*reinterpret_cast< QQuickItem*(*)>(_a[1]))); break;
        case 8: _t->imageReceived(); break;
        default: ;
        }
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 7:
            switch (*reinterpret_cast<int*>(_a[1])) {
            default: *reinterpret_cast<int*>(_a[0]) = -1; break;
            case 0:
                *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QQuickItem* >(); break;
            }
            break;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (CVCamera::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&CVCamera::sizeChanged)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (CVCamera::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&CVCamera::deviceListChanged)) {
                *result = 1;
                return;
            }
        }
        {
            typedef void (CVCamera::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&CVCamera::cvImageChanged)) {
                *result = 2;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 1:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< QAbstractVideoSurface* >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        CVCamera *_t = static_cast<CVCamera *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< int*>(_v) = _t->getDevice(); break;
        case 1: *reinterpret_cast< QAbstractVideoSurface**>(_v) = _t->getVideoSurface(); break;
        case 2: *reinterpret_cast< QSize*>(_v) = _t->getSize(); break;
        case 3: *reinterpret_cast< QStringList*>(_v) = _t->getDeviceList(); break;
        case 4: *reinterpret_cast< QVariant*>(_v) = _t->getCvImage(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        CVCamera *_t = static_cast<CVCamera *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setDevice(*reinterpret_cast< int*>(_v)); break;
        case 1: _t->setVideoSurface(*reinterpret_cast< QAbstractVideoSurface**>(_v)); break;
        case 2: _t->setSize(*reinterpret_cast< QSize*>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

const QMetaObject CVCamera::staticMetaObject = {
    { &QQuickItem::staticMetaObject, qt_meta_stringdata_CVCamera.data,
      qt_meta_data_CVCamera,  qt_static_metacall, Q_NULLPTR, Q_NULLPTR}
};


const QMetaObject *CVCamera::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *CVCamera::qt_metacast(const char *_clname)
{
    if (!_clname) return Q_NULLPTR;
    if (!strcmp(_clname, qt_meta_stringdata_CVCamera.stringdata0))
        return static_cast<void*>(const_cast< CVCamera*>(this));
    return QQuickItem::qt_metacast(_clname);
}

int CVCamera::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QQuickItem::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 9)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 9;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 5;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 5;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void CVCamera::sizeChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 0, Q_NULLPTR);
}

// SIGNAL 1
void CVCamera::deviceListChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 1, Q_NULLPTR);
}

// SIGNAL 2
void CVCamera::cvImageChanged()
{
    QMetaObject::activate(this, &staticMetaObject, 2, Q_NULLPTR);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
