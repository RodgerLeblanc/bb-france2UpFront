APP_NAME = bb_france2UpFront

CONFIG += qt warn_on cascades10

include(config.pri)

LIBS += -lbb -lbbsystem

TRANSLATIONS = \
    $${TARGET}_fr.ts \
    $${TARGET}_es.ts \
    $${TARGET}_en.ts \
    $${TARGET}.ts