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

#ifndef SERVICE_H_
#define SERVICE_H_

#include <QObject>
#include <QTimer>
#include <QNetworkAccessManager>
#include <QSettings>

namespace bb {
	class Application;
	namespace platform {
		class Notification;
	}
	namespace system {
		class InvokeManager;
		class InvokeRequest;
	}
}

class QNetworkAccessManager;
class UpFront;

class Service: public QObject {
	Q_OBJECT
public:
	Service(bb::Application * app);

private slots:
	void handleInvoke(const bb::system::InvokeRequest &);
	void onTimer();
	void onRssRead();

private:
	bb::platform::Notification * m_notify;
	bb::system::InvokeManager * m_invokeManager;

	void triggerNotification();
	void getRss(QString url);

	QTimer* timer;
    QNetworkAccessManager* m_networkAccessManager;
    UpFront *m_upFront;

    QSettings settings;
};

#endif /* SERVICE_H_ */
