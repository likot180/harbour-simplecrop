# NOTICE:
#
# Application name defined in TARGET has a corresponding QML filename.
# If name defined in TARGET is changed, the following needs to be done
# to match new name:
#   - corresponding QML filename must be changed
#   - desktop icon filename must be changed
#   - desktop filename must be changed
#   - icon definition filename in desktop file must be changed
#   - translation filenames have to be changed

# The name of your application
TARGET = harbour-simplecrop

CONFIG += sailfishapp

SOURCES += src/harbour-simplecrop.cpp \


DISTFILES += qml/harbour-simplecrop.qml \
    lib/PIL/*.py \
    qml/cover/CoverPage.qml \
    qml/pages/ChannelBench.qml \
    qml/pages/CollageBench.qml \
    qml/pages/ColorcurveBench.qml \
    qml/pages/EffectsBench.qml \
    qml/pages/FilterBench.qml \
    qml/pages/FirstPage.qml \
    qml/pages/InfoPage.qml \
    qml/pages/MetadataPage.qml \
    qml/pages/NewPage.qml \
    qml/pages/PixelBench.qml \
    qml/pages/RenamePage.qml \
    qml/pages/SavePage.qml \
    qml/pages/SharePage.qml \
    qml/pages/ViewPage.qml \
    qml/pages/perspectivetransformhelper.js \
    rpm/harbour-simplecrop.changes \
    rpm/harbour-simplecrop.changes.run \
    rpm/harbour-simplecrop.spec \
    rpm/harbour-simplecrop.yaml \
    translations/*.ts \
    harbour-simplecrop.desktop \

SAILFISHAPP_ICONS = 86x86 108x108 128x128 172x172

# to disable building translations every time, comment out the
# following CONFIG line
CONFIG += sailfishapp_i18n

# German translation is enabled as an example. If you aren't
# planning to localize your app, remember to comment out the
# following TRANSLATIONS line. And also do not forget to
# modify the localized app name in the the .desktop file.
# TRANSLATIONS += translations/harbour-simplecrop-de.ts

HEADERS +=

# include library according to architecture (arm, i486_32bit, arm64)
equals(QT_ARCH, arm): {
  pil_static.files = lib/arm32/*
  message("!!!architecture armv7hl detected!!!");
}
equals(QT_ARCH, i386): {
  pil_static.files = lib/x86_32/*
  message("!!!architecture x86 / 32bit detected!!!");
}
# equals(QT_ARCH, arm64): {
#  pil_static.files = lib/ffmpeg/arm64/*
#  message("!!!architecture arm64 detected!!!");
#}*/


INSTALLS += pil_static

# include a static library
python.files = pil_static.files
python.path = "/usr/share/harbour-simplecrop/lib"
INSTALLS += python
