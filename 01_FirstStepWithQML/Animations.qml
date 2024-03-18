import QtQuick

Rectangle {
    color: "lightgray"
    width: 200
    height: 200

    property int animatedValue: 0
    SequentialAnimation on animatedValue {
        loops: Animation.Infinite
        PropertyAnimation { to: 150; duration: 1000 }
        PropertyAnimation { to: 0; duration: 1000 }
    }

    Text {
        anchors.centerIn: parent
        text: parent.animatedValue
    }
}
