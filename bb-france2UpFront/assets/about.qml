import bb.cascades 1.2

Page {
    titleBar: TitleBar {
        title : qsTr("About") + Retranslate.onLanguageChanged
    }
    ScrollView {
        Container {            
            Container {                
                leftPadding: 100
                rightPadding: leftPadding
                topPadding: 30
                bottomPadding: topPadding
                horizontalAlignment: HorizontalAlignment.Center
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    bottomPadding: 30
                    Label {
                        text: qsTr("This app updates UpFront' Active Frame in the background (headless). Click on the icon to download UpFront") + Retranslate.onLanguageChanged
                        verticalAlignment: VerticalAlignment.Center
                        //                      textStyle.color: Color.Gray
                        horizontalAlignment: HorizontalAlignment.Center
                        multiline: true
                    }            
                    ImageButton {
                        defaultImageSource: "asset:///images/UpFront_tv_94_94.png"
                        onClicked: {
                            _app.openThisAppInBBW("http://appworld.blackberry.com/webstore/content/55423610");
                        }                    
                        verticalAlignment: VerticalAlignment.Center
                        minHeight: 94
                        minWidth: 94
                    }    
                }            
                Divider {}
                Label {
                    text: qsTr("Developped by\nRoger Leblanc\nVersion: ") + Retranslate.onLanguageChanged + Application.applicationVersion
                    //                    textStyle.color: Color.Gray
                    horizontalAlignment: HorizontalAlignment.Center
                    multiline: true
                }
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    bottomPadding: 30
                    Label {
                        text: qsTr("Contact dev :") + Retranslate.onLanguageChanged
                        verticalAlignment: VerticalAlignment.Center
                        //                        textStyle.color: Color.Gray
                        horizontalAlignment: HorizontalAlignment.Center
                    }            
                    ImageButton {
                        defaultImageSource: "asset:///images/ic_email.png"
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                        onClicked: {
                            _app.invoke("EMAIL");
                        }                    
                    }    
                    ImageButton {
                        defaultImageSource: "asset:///images/ic_bbm.png"
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                        onClicked: {
                            _app.invoke("BBM");
                        }                    
                    }    
                    ImageButton {
                        defaultImageSource: "asset:///images/ic_twitter.png"
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center
                        onClicked: {
                            _app.invoke("TWITTER");
                        }                    
                    }    
                }            
                Container {
                    layout: StackLayout {
                        orientation: LayoutOrientation.LeftToRight
                    }
                    horizontalAlignment: HorizontalAlignment.Center
                    verticalAlignment: VerticalAlignment.Center
                    bottomPadding: 30
                    Label {
                        text: qsTr("Other apps from this dev :") + Retranslate.onLanguageChanged
                        verticalAlignment: VerticalAlignment.Center
                        //                      textStyle.color: Color.Gray
                        horizontalAlignment: HorizontalAlignment.Center
                    }            
                    ImageButton {
                        defaultImageSource: "asset:///images/bbw.png"
                        onClicked: {
                            _app.invoke("BBW");
                        }                    
                    }    
                }            
            }            
        }
    }
}
