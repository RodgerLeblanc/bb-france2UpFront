import bb.cascades 1.2

Page {
    titleBar: TitleBar {
        title : qsTr("Settings") + Retranslate.onLanguageChanged
    }
    Container {                    
        layout: StackLayout {}                    
        ScrollView {
            Container {
                topPadding: 10
                leftPadding: 30
                rightPadding: leftPadding
                bottomPadding: topPadding
                verticalAlignment: VerticalAlignment.Fill
                horizontalAlignment: HorizontalAlignment.Fill
                Container {
                    topPadding: 10
                    layout: StackLayout {orientation: LayoutOrientation.TopToBottom}
                    Label {
                        text: qsTr("Check for new articles every " + newArticleSlider.immediateValue.toFixed(0) + " minutes") + Retranslate.onLanguageChanged
                        multiline: true
                    }
                    Slider {
                        id: newArticleSlider
                        value: _app.getValueFor("newArticleSlider", "15")
                        fromValue: 1
                        toValue: 60
                        onValueChanged: _app.saveValueFor("newArticleSlider", value.toFixed(0))
                    }
                }
                Divider {}
                Container {
                    topPadding: 10
                    layout: StackLayout {orientation: LayoutOrientation.TopToBottom}
                    Label {
                        text: qsTr("Choose the text color in UpFront") + Retranslate.onLanguageChanged
                        multiline: true
                    }
                    DropDown {
                        id: colorDropDown
                        onSelectedOptionChanged: _app.saveValueFor("colorDropDown", selectedOption.text.toLowerCase())
                        onCreationCompleted: {
                            if (_app.getValueFor("colorDropDown", "darkblue") == "black")
                                setSelectedOption(black)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "darkblue")
                                setSelectedOption(darkBlue)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "cyan")
                                setSelectedOption(cyan)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "darkcyan")
                                setSelectedOption(darkCyan)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "darkgray")
                            	setSelectedOption(darkGray)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "darkgreen")
                            	setSelectedOption(darkGreen)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "darkmagenta")
                                setSelectedOption(darkMagenta)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "darkred")
                                setSelectedOption(darkRed)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "darkyellow")
                                setSelectedOption(darkYellow)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "gray")
                                setSelectedOption(gray)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "green")
                                setSelectedOption(green)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "lightgray")
                                setSelectedOption(lightGray)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "magenta")
                                setSelectedOption(magenta)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "red")
                                setSelectedOption(red)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "transparent")
                                setSelectedOption(transparent)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "white")
                                setSelectedOption(white)
                            if (_app.getValueFor("colorDropDown", "darkblue") == "yellow")
                                setSelectedOption(yellow)
                        }
                        Option {
                            id: black
                            text: "Black"
                            value: "Black"
                        }
                        Option {
                            id: blue
                            text: "Blue"
                            value: "Blue"
                        }
                        Option {
                            id: cyan
                            text: "Cyan"
                            value: "Cyan"
                        }
                        Option {
                            id: darkBlue
                            text: "DarkBlue"
                            value: "DarkBlue"
                        }
                        Option {
                            id: darkCyan
                            text: "DarkCyan"
                            value: "DarkCyan"
                        }
                        Option {
                            id: darkGray
                            text: "DarkGray"
                            value: "DarkGray"
                        }
                        Option {
                            id: darkGreen
                            text: "DarkGreen"
                            value: "DarkGreen"
                        }
                        Option {
                            id: darkMagenta
                            text: "DarkMagenta"
                            value: "DarkMagenta"
                        }
                        Option {
                            id: darkRed
                            text: "DarkRed"
                            value: "DarkRed"
                        }
                        Option {
                            id: darkYellow
                            text: "DarkYellow"
                            value: "DarkYellow"
                        }
                        Option {
                            id: gray
                            text: "Gray"
                            value: "Gray"
                        }
                        Option {
                            id: green
                            text: "Green"
                            value: "Green"
                        }
                        Option {
                            id: lightGray
                            text: "LightGray"
                            value: "LightGray"
                        }
                        Option {
                            id: magenta
                            text: "Magenta"
                            value: "Magenta"
                        }
                        Option {
                            id: red
                            text: "Red"
                            value: "Red"
                        }
                        Option {
                            id: transparent
                            text: "Transparent"
                            value: "Transparent"
                        }
                        Option {
                            id: white
                            text: "White"
                            value: "White"
                        }
                        Option {
                            id: yellow
                            text: "Yellow"
                            value: "Yellow"
                        }
                    }
                }                    
            }
            accessibility.description: "Settings"
            accessibility.name: "settingsSheet"
        }
    }   
}         

