#include <QtQuick>
#include <QQmlComponent>
#include <sailfishapp.h>
#include <fileman_version.h>
#include "thumbnailprovider.h"
#include "settings.h"
#include "filelist.h"
#include "fileengine.h"
#include "covermodel.h"
#include "searchengine.h"

int main(int argc, char *argv[])
{
    qmlRegisterType<SearchEngine>("harbour.fileman.SearchEngine", 1, 0, "SearchEngine");
    qRegisterMetaType<QList<FileInfoEntry*> >();

    QGuiApplication *app = SailfishApp::application(argc, argv);
    QQuickView *view = SailfishApp::createView();

    app->setApplicationVersion(QStringLiteral(FILEMAN_VERSION));

    qmlRegisterType<Settings>("harbour.fileman.settings",1,0,"SettingsObject");

    // Add image providers and C++ classes
    view->engine()->addImageProvider(QLatin1String("thumbnail"), new ThumbnailProvider);

    FileEngine fileEngine;
    view->engine()->rootContext()->setContextProperty("engine", &fileEngine);
    view->engine()->rootContext()->setContextProperty("fileList", fileEngine.fileList);
    view->engine()->rootContext()->setContextProperty("fileInfo", fileEngine.fileInfo);
    view->engine()->rootContext()->setContextProperty("fileProcess", fileEngine.fileProcess);
    view->engine()->rootContext()->setContextProperty("clipboard", fileEngine.clipboard);
    view->engine()->rootContext()->setContextProperty("settings", fileEngine.settings);
    view->engine()->rootContext()->setContextProperty("coverModel", fileEngine.coverModel);

    // Show the application
    view->setSource(SailfishApp::pathTo("qml/Fileman.qml"));
    view->show();

    return app->exec();
}

