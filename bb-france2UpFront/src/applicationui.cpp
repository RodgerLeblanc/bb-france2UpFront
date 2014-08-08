/*
 * Copyright (c) 2013 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "applicationui.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include <bb/cascades/LocaleHandler>
#include <bb/system/InvokeManager>

using namespace bb::cascades;
using namespace bb::system;

ApplicationUI::ApplicationUI(Application *app):
		QObject(app),
		m_translator(new QTranslator(this)),
		m_localeHandler(new LocaleHandler(this)),
		m_invokeManager(new InvokeManager(this))
{
	// prepare the localization
	if (!QObject::connect(m_localeHandler, SIGNAL(systemLanguageChanged()),
			this, SLOT(onSystemLanguageChanged()))) {
		// This is an abnormal situation! Something went wrong!
		// Add own code to recover here
		qWarning() << "Recovering from a failed connect()";
	}

	// Sets the URL
	settings.setValue("webViewUrl", "http://www.blackberry-france.com/");
	settings.setValue("rssFeed", "http://www.blackberry-france.com/feed/");

	// initial load
	onSystemLanguageChanged();

	// Create scene document from main.qml asset, the parent is set
	// to ensure the document gets destroyed properly at shut down.
	QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);

	// Make app available to the qml.
	qml->setContextProperty("_app", this);

	// Create root object for the UI
	AbstractPane *root = qml->createRootObject<AbstractPane>();

	// Set created root object as the application scene
	app->setScene(root);

	// Start HL part
	InvokeRequest request;
	request.setTarget("com.example.bb_france2UpFrontService");
	request.setAction("com.example.bb_france2UpFrontService.START");
	m_invokeManager->invoke(request);

//	Application::instance()->minimize();
}

void ApplicationUI::onSystemLanguageChanged() {
	QCoreApplication::instance()->removeTranslator(m_translator);
	// Initiate, load and install the application translation files.
	QString locale_string = QLocale().name();
	QString file_name = QString("bb_france2UpFront_%1").arg(locale_string);
	if (m_translator->load(file_name, "app/native/qm")) {
		QCoreApplication::instance()->installTranslator(m_translator);
	}
}

void ApplicationUI::resendNotification() {
	InvokeRequest request;
	request.setTarget("com.example.bb_france2UpFrontService");
	request.setAction("com.example.bb_france2UpFrontService.RESET");
	m_invokeManager->invoke(request);
	Application::instance()->minimize();
}

QString ApplicationUI::getValueFor(const QString key, const QString defaultValue) {
	qDebug() << key << settings.value(key, defaultValue).toString();
	return settings.value(key, defaultValue).toString();
}

void ApplicationUI::saveValueFor(const QString key, const QString value) {
	qDebug() << key << value;
	settings.setValue(key, value);
	settings.sync();

	// Update UpFront every time a settings change to reflect the new settings
	InvokeRequest request;
	request.setTarget("com.example.bb_france2UpFrontService");
	request.setAction("com.example.bb_france2UpFrontService.UPDATEUPFRONT");
	m_invokeManager->invoke(request);
}

void ApplicationUI::openThisAppInBBW(const QString bbwLink)
{
    InvokeRequest request;
    request.setAction("bb.action.OPEN");
    request.setUri(bbwLink);
    request.setTarget("sys.appworld");

    // Start the invocation
    InvokeManager* invokeManager = new InvokeManager(this);
    invokeManager->invoke(request);
    invokeManager->deleteLater();
}

void ApplicationUI::invoke(QString platform)
{
    // Create a new invocation request
    InvokeRequest request;
    if (platform == "BBM") {
        request.setAction("bb.action.BBMCHAT");
        request.setUri("pin:2B1F7E7B");
        request.setTarget("sys.bbm.sharehandler");
    }
    if (platform == "EMAIL") {
        request.setAction("bb.action.COMPOSE");
        bb::Application* thisApp;
        const QString uri = "mailto:upfront@rogerleblanc.net?subject=" + thisApp->applicationName() + "%20version%20" + thisApp->applicationVersion();
        request.setUri(uri);
        request.setMimeType("text/plain");
        request.setData("Test");
        request.setTarget("sys.pim.uib.email.hybridcomposer");
    }
    if (platform == "TWITTER") {
        request.setAction("bb.action.VIEW");
        request.setUri("twitter:connect:RodgerLeblanc");
        request.setTarget("com.twitter.urihandler");
    }
    if (platform == "BBW") {
        request.setAction("bb.action.OPEN");
        request.setUri("appworld://vendor/70290");
        request.setTarget("sys.appworld");
    }
    // Start the invocation
    InvokeManager* invokeManager = new InvokeManager(this);
    invokeManager->invoke(request);
    invokeManager->deleteLater();
}
