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

import bb.cascades 1.2

NavigationPane {
    id: nav
    onCreationCompleted: {
        // Lock device orientation to portrait on startup
//        OrientationSupport.supportedDisplayOrientation = SupportedDisplayOrientation.DisplayPortrait;  
    }
    
    Menu.definition: MenuDefinition {
        
        // Add a Help action        
/*        helpAction: HelpActionItem {
            onTriggered: {
                // Set the correct file source on the ComponentDefinition, create the Page, and set its title.
                menu.source = "help.qml";
                var page = menu.createObject();
                
                // Push the new Page.
                Application.menuEnabled = false;
                nav.push(page);
            }
        }
*/        
        // Add a Settings action
        settingsAction: SettingsActionItem {
            onTriggered: {
                menu.source = "settings.qml";
                var page = menu.createObject();
                
                // Push the new Page.
                Application.menuEnabled = false;
                nav.push(page);
            }
        }
        
        actions: [
            ActionItem {
                title: qsTr("About") + Retranslate.onLanguageChanged
                ActionBar.placement: ActionBarPlacement.OnBar
                imageSource: "asset:///images/ic_info.png"
                onTriggered: {
                    menu.source = "about.qml";
                    var page = menu.createObject();
                    
                    // Push the new Page.
                    Application.menuEnabled = false;
                    nav.push(page);
                }
            }
        ]      
    
    } // end of MenuDefinition
    onPopTransitionEnded: {
        page.destroy();    
        Application.menuEnabled = true;
    }
    attachedObjects: [
        ComponentDefinition {
            id: menu
        }
    ]

    Page {
        Container {
            ScrollView {
//                scrollViewProperties {
//                    scrollMode: ScrollMode.Both
//                    pinchToZoomEnabled: true
//                    initialScalingMethod: ScalingMethod.AspectFit
//                }
                Container {                    
//                   verticalAlignment: VerticalAlignment.Fill
//                   horizontalAlignment: HorizontalAlignment.Fill                            
                    WebView {
                        id: webViewBack
                        url: _app.getValueFor("webViewUrl", "")
                    }
                }
            }
            Container {
                visible: webViewBack.canGoBack
                horizontalAlignment: HorizontalAlignment.Center
                layout: StackLayout {orientation: LayoutOrientation.LeftToRight}
                ImageButton {                                
                    defaultImageSource: "asset:///images/ic_previous.png"
                    onClicked: {
                        webViewBack.goBack()
                    }
                }                    
                Label {
                    verticalAlignment: VerticalAlignment.Center
                    text: qsTr("Back")
                    onTouch: {
                        webViewBack.goBack()
                    }
                }                
            }
/*
            Button {
                text: qsTr("Resend Notification") + Retranslate.onLocaleOrLanguageChanged
                onClicked: {
                    _app.resendNotification();
                }
            } 
*/
        }
    }    
}