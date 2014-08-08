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


#include "service.hpp"

#include "UpFront.h"
#include <bb/ApplicationInfo>

#include <bb/Application>
#include <bb/platform/Notification>
#include <bb/platform/NotificationDefaultApplicationSettings>
#include <bb/system/InvokeManager>
#include <QNetworkReply>
#include <QNetworkRequest>
 #include <bb/data/XmlDataAccess>

using namespace bb::platform;
using namespace bb::system;

Service::Service(bb::Application * app)	:
		QObject(app),
		m_notify(new Notification(this)),
		m_invokeManager(new InvokeManager(this))
{
    m_networkAccessManager = new QNetworkAccessManager(this);
    m_upFront = new UpFront(this);

    NotificationDefaultApplicationSettings notifSettings;
	notifSettings.setPreview(NotificationPriorityPolicy::Allow);
	notifSettings.apply();

	m_notify->setTitle("bb-france2UpFront Service");
	m_notify->setBody("bb-france2UpFront service requires attention");

	bb::system::InvokeRequest request;
	request.setTarget("com.example.bb_france2UpFront");
	request.setAction("bb.action.START");
	m_notify->setInvokeRequest(request);

	timer = new QTimer(this);
	connect(timer, SIGNAL(timeout()), this, SLOT(onTimer()));
	timer->start(settings.value("newArticleSlider", "15").toDouble() * 60 * 1000);

	onTimer();

	m_invokeManager->connect(m_invokeManager, SIGNAL(invoked(const bb::system::InvokeRequest&)),
            this, SLOT(handleInvoke(const bb::system::InvokeRequest&)));
}

void Service::handleInvoke(const bb::system::InvokeRequest & request) {
	if (request.action().compare("com.example.bb_france2UpFrontService.RESET") == 0) {
		bb::Application::instance()->quit();
//		triggerNotification();
	}
	if (request.action().compare("com.example.bb_france2UpFrontService.UPDATEUPFRONT") == 0) {
		settings.sync();
		timer->start(settings.value("newArticleSlider", "15").toDouble() * 60 * 1000);
		onTimer();
	}
}

void Service::triggerNotification() {
}

void Service::onTimer() {
	qDebug() << "onTimer";
	settings.sync();
	getRss(settings.value("rssFeed", "").toString());
//	getRss("http://feeds.feedburner.com/crackberry");
}

void Service::getRss(QString url) {
	qDebug() << "getRss" << url;
	QNetworkRequest request;
	request.setUrl(url);

	QNetworkReply* replyGet = m_networkAccessManager->get(request);
	connect(replyGet, SIGNAL(finished()), this, SLOT(onRssRead()));
}

void Service::onRssRead() {
	settings.sync();
	qDebug() << "onRssRead";
    QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());

    if (reply) {
        if (reply->error() == QNetworkReply::NoError) {
            const int available = reply->bytesAvailable();
            if (available > 0) {
            	const QByteArray buffer(reply->readAll());
        		bb::data::XmlDataAccess xda;
        		const QVariant xmlChannel = xda.loadFromBuffer(buffer, "rss/channel");
        		qDebug() << xmlChannel;
        		const QVariant xmlData = xda.loadFromBuffer(buffer, "rss/channel/item");
        		qDebug() << xmlData;
        		const QVariantMap channelMap = xmlChannel.toMap();
        		const QVariantList rssList = xmlData.toList();
        		const QString channelTitle = channelMap.value("title").toString();
        		if (!rssList.isEmpty()) {
    	    		const QString articleTitle = rssList.first().toMap().value("title").toString();
    	    		if (!articleTitle.isEmpty()) {
    	    			qDebug() << "articleTitle" << articleTitle;
    	    			bb::ApplicationInfo appInfo;
    	    			QString backgroundZ = "http://s26.postimg.org/cr9mmc961/bby_france_logo2.png"; // Web Url, preferred dimensions : 334X351
    	    			QString backgroundQ = backgroundZ; // Web Url, preferred dimensions : 310X166
    	    			QString icon = "http://s26.postimg.org/w1gn5rv51/icon_bby_france.png"; // Web Url, preferred dimensions : 38X38
    	    			QString message = channelTitle + ":\n" + articleTitle; // The message shown in UpFront Active Frame
    	    			QString seconds = ""; // Number of seconds your message will remain accessible by UpFront (max of 3600, if left empty = 3600)
    	    			QString sendToT2w = ""; // "True" or "False", if set to "True", a message will be sent to Pebble every time this command is send, please don't abuse
    	    			QString textColor = settings.value("colorDropDown", "darkblue").toString(); // Choose any color available in QML
    	    			QString other = ""; // Some extra features will be added here. Please see "Customize UpFront even more.txt" for more details.
    	    			if (message.size() < 50)
    	    				other.append("FontSize:Medium");
    	    			if (message.size() > 109)
    	    				other.append("FontSize:XSmall");
    	    			QString command = appInfo.signingHash() + "##" + appInfo.title() + "##" + backgroundZ + "##" + backgroundQ + "##" + icon + "##" + message.toUtf8() + "##" + seconds + "##" + sendToT2w + "##" + textColor + "##" + other;
    	    			m_upFront->updateUpFront(command);
    	    		}
    	    	}
            }
        } // end of : if (reply->error() == QNetworkReply::NoError)
        reply->deleteLater();
    }  // end of : if (reply)
}
