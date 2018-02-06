import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3

Popup {
    property int modalPadding: 20
    property alias text: prompt.text
    property alias title: title.text
    property alias confirmText: btnConfirm.label
    property alias cancelText: btnCancel.label

    id: popup
    x: (parent.width - width) / 2
    y: (parent.height - height) / 2
    modal: true
    focus: true
    dim: true
    closePolicy: Popup.CloseOnEscape
    padding: 0

    signal confirmed
    signal cancelled

    background: Rectangle {
        color: "#3A3E46"
        radius: 4
    }

    RowLayout {
        id: header
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.leftMargin: modalPadding
        anchors.rightMargin: modalPadding
        height: 48.61

        Text {
            id: title
            Layout.fillWidth: true
            verticalAlignment: Text.AlignVCenter
            text: qsTr("PAYMENT CONFIRMATION")
            color: "#E2E2E2"
            font.pixelSize: 15
            font.family: "Roboto"
        }

        IconButton {
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height
            Layout.preferredWidth: 20

            iconColor: "#fff"
            icon.source: "../icons/cross.svg"
            icon.sourceSize.width: 10

            onClicked: {
                cancelled();
            }
        }
    }

    Rectangle {
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: "#535353"
        height: 1
    }

    ColumnLayout {
        anchors.margins: modalPadding
        anchors.top: header.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom

        Text {
            id: prompt
            Layout.fillWidth: true
            color: "#FFF7F7"
            font.pixelSize: 18
            wrapMode: Text.WordWrap
        }

        RowLayout {
            spacing: 16

            ButtonModal {
                id: btnConfirm
                isPrimary: true
                onButtonClicked: {
                    confirmed();
                }
            }

            ButtonModal {
                id: btnCancel
                isPrimary: false
                onButtonClicked: {
                    cancelled();
                }
            }
        }
    }
}