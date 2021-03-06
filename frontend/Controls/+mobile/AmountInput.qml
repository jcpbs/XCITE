/**
 * Filename: TextInput.qml
 *
 * XCITE is a secure platform utilizing the XTRABYTES Proof of Signature
 * blockchain protocol to host decentralized applications
 *
 * Copyright (c) 2017-2018 Zoltan Szabo & XTRABYTES developers
 *
 * This file is part of an XTRABYTES Ltd. project.
 *
 */

import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0

import "qrc:/Theme" 1.0

TextField {
    property int mobile: 0
    property int addressBook: 0
    property int deleteBtn: 1
    property alias textBackground: inputBackground.color
    property int textboxHeight: textInputComponent.height

    id: textInputComponent
    color: "white"
    font.weight: Font.Bold
    font.pixelSize: 24
    leftPadding: 42
    rightPadding: textboxHeight
    topPadding: 10
    bottomPadding: 10
    verticalAlignment: Text.AlignVCenter
    selectByMouse: true
    inputMethodHints: Qt.ImhFormattedNumbersOnly
    background: Rectangle {
        id: inputBackground
        color: "#34363D"
        radius: 4
        border.width: parent.activeFocus ? 2 : 0
        border.color: "#34363D"
        implicitWidth: 273
    }
    onActiveFocusChanged: {
        if (textInputComponent.focus) {
            EventFilter.focus(this)
        }
    }

    property alias placeholder: placeholderTextComponent.text

    Text {
        id: placeholderTextComponent
        anchors.fill: textInputComponent
        font: textInputComponent.font
        horizontalAlignment: textInputComponent.horizontalAlignment
        verticalAlignment: textInputComponent.verticalAlignment
        leftPadding: textInputComponent.leftPadding
        rightPadding: textInputComponent.rightPadding
        topPadding: textInputComponent.topPadding
        bottomPadding: textInputComponent.bottomPadding
        opacity: !textInputComponent.displayText
                 && (!textInputComponent.activeFocus
                     || textInputComponent.horizontalAlignment !== Qt.AlignHCenter) ? 1.0 : 0.0
        color: textInputComponent.color
        clip: contentWidth > width
        elide: Text.ElideRight
    }

    Image {
        id: deleteInput
        source: 'qrc:/icons/CloseIcon.svg'
        height: 12
        width: 12
        anchors.right: textInputComponent.right
        anchors.rightMargin: 11
        anchors.verticalCenter: textInputComponent.verticalCenter
        visible: textInputComponent.text != ""

        ColorOverlay {
            anchors.fill: parent
            source: parent
            color: "#F2F2F2"
        }

        MouseArea {
            width: textboxHeight
            height: textboxHeight
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                textInputComponent.text = ""
            }
        }
    }

    Image {
        id: amountCalculator
        source: 'qrc:/icons/icon-converter.svg'
        height: 16
        width: 20
        anchors.left: textInputComponent.left
        anchors.leftMargin: 11
        anchors.verticalCenter: textInputComponent.verticalCenter

        ColorOverlay {
            anchors.fill: parent
            source: parent
            color: "#F2F2F2"
        }

        MouseArea {
            width: textboxHeight
            height: textboxHeight
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                calculatorTracker = 1
            }
        }
    }
}
