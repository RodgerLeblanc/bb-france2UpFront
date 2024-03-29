# Auto-generated by IDE. Any changes made by user will be lost!
BASEDIR =  $$quote($$_PRO_FILE_PWD_)

device {
    CONFIG(debug, debug|release) {
        INCLUDEPATH +=  $$quote(${QNX_TARGET}/usr/include/libxml) \
                 $$quote(${QNX_TARGET}/usr/include/libxslt) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXmlPatterns) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                 $$quote(${QNX_TARGET}/usr/include/bb/data) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtDeclarative)

        DEPENDPATH +=  $$quote(${QNX_TARGET}/usr/include/libxml) \
                 $$quote(${QNX_TARGET}/usr/include/libxslt) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXmlPatterns) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                 $$quote(${QNX_TARGET}/usr/include/bb/data) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtDeclarative)

        LIBS += -lxslt \
                -lQtXml \
                -lQtDeclarative \
                -lbbdata \
                -lxml2 \
                -lQtNetwork \
                -lQtXmlPatterns

        SOURCES +=  $$quote($$BASEDIR/src/UpFront.cpp) \
                 $$quote($$BASEDIR/src/main.cpp) \
                 $$quote($$BASEDIR/src/service.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/UpFront.h) \
                 $$quote($$BASEDIR/src/service.hpp)
    }

    CONFIG(release, debug|release) {
        INCLUDEPATH +=  $$quote(${QNX_TARGET}/usr/include/libxml) \
                 $$quote(${QNX_TARGET}/usr/include/libxslt) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXmlPatterns) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                 $$quote(${QNX_TARGET}/usr/include/bb/data) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtDeclarative)

        DEPENDPATH +=  $$quote(${QNX_TARGET}/usr/include/libxml) \
                 $$quote(${QNX_TARGET}/usr/include/libxslt) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXmlPatterns) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                 $$quote(${QNX_TARGET}/usr/include/bb/data) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtDeclarative)

        LIBS += -lxslt \
                -lQtXml \
                -lQtDeclarative \
                -lbbdata \
                -lxml2 \
                -lQtNetwork \
                -lQtXmlPatterns

        SOURCES +=  $$quote($$BASEDIR/src/UpFront.cpp) \
                 $$quote($$BASEDIR/src/main.cpp) \
                 $$quote($$BASEDIR/src/service.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/UpFront.h) \
                 $$quote($$BASEDIR/src/service.hpp)
    }
}

simulator {
    CONFIG(debug, debug|release) {
        INCLUDEPATH +=  $$quote(${QNX_TARGET}/usr/include/libxml) \
                 $$quote(${QNX_TARGET}/usr/include/libxslt) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXmlPatterns) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                 $$quote(${QNX_TARGET}/usr/include/bb/data) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtDeclarative)

        DEPENDPATH +=  $$quote(${QNX_TARGET}/usr/include/libxml) \
                 $$quote(${QNX_TARGET}/usr/include/libxslt) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXmlPatterns) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtNetwork) \
                 $$quote(${QNX_TARGET}/usr/include/bb/data) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtXml) \
                 $$quote(${QNX_TARGET}/usr/include/qt4/QtDeclarative)

        LIBS += -lxslt \
                -lQtXml \
                -lQtDeclarative \
                -lbbdata \
                -lxml2 \
                -lQtNetwork \
                -lQtXmlPatterns

        SOURCES +=  $$quote($$BASEDIR/src/UpFront.cpp) \
                 $$quote($$BASEDIR/src/main.cpp) \
                 $$quote($$BASEDIR/src/service.cpp)

        HEADERS +=  $$quote($$BASEDIR/src/UpFront.h) \
                 $$quote($$BASEDIR/src/service.hpp)
    }
}

INCLUDEPATH +=  $$quote($$BASEDIR/src)

CONFIG += precompile_header

PRECOMPILED_HEADER =  $$quote($$BASEDIR/precompiled.h)

lupdate_inclusion {
    SOURCES +=  $$quote($$BASEDIR/../src/*.c) \
             $$quote($$BASEDIR/../src/*.c++) \
             $$quote($$BASEDIR/../src/*.cc) \
             $$quote($$BASEDIR/../src/*.cpp) \
             $$quote($$BASEDIR/../src/*.cxx) \
             $$quote($$BASEDIR/../assets/*.qml) \
             $$quote($$BASEDIR/../assets/*.js) \
             $$quote($$BASEDIR/../assets/*.qs)

    HEADERS +=  $$quote($$BASEDIR/../src/*.h) \
             $$quote($$BASEDIR/../src/*.h++) \
             $$quote($$BASEDIR/../src/*.hh) \
             $$quote($$BASEDIR/../src/*.hpp) \
             $$quote($$BASEDIR/../src/*.hxx)
}

TRANSLATIONS =  $$quote($${TARGET}.ts)
