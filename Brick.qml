import QtQuick 2.0

Rectangle {
    id: brick
    width: 60
    height: 60
    color: "#FAE5E8"
    border.width: 1.5
    border.color: "#664954"

    property int num: 0
    property bool pregiven: false

    function change() {
        num = num + 1
        if(num===10) num = 0
    }

    signal changed(int num)

    Rectangle {
        id: one

        Text {
            id: txt1
            text: " 1"
                font.pointSize: 30
               // color: pregiven ? "#0000FF" : "black"
                color: pregiven ? "black" : "#0000FF"
                visible: (num) === 1
               }
    }

    Rectangle {
        id: two
        Text {
            text: " 2"
              font.pointSize: 30
              color: pregiven ? "black" : "#0000FF"
                visible: (num) === 2
        }
    }

    Rectangle {
        id: three
        Text {
            text: " 3"
             font.pointSize: 30
            color: pregiven ? "black" : "#0000FF"
                visible: (num) === 3
        }
    }

    Rectangle {
        id: four
        Text {
            text: " 4"
              font.pointSize: 30
              color: pregiven ? "black" : "#0000FF"
                visible: (num) === 4
        }
    }

    Rectangle {
        id: five
        Text {
            text: " 5"
              font.pointSize: 30
              color: pregiven ? "black" : "#0000FF"
                visible: (num) === 5
        }
    }

    Rectangle {
        id: six
        Text {
            text: " 6"
             font.pointSize: 30
             color: pregiven ? "black" : "#0000FF"
                visible: (num) === 6
        }
    }

    Rectangle {
        id: seven
        Text {
            text: " 7"
              font.pointSize: 30
              color: pregiven ? "black" : "#0000FF"
                visible: (num) === 7
        }
    }

    Rectangle {
        id: eight
        Text {
            text: " 8"
              font.pointSize: 30
              color: pregiven ? "black" : "#0000FF"
                visible: (num) === 8
        }
    }

    Rectangle {
        id: nine
        Text {
            text: " 9"
              font.pointSize: 30
              color: pregiven ? "black" : "#0000FF"
                visible: (num) === 9
        }
    }


MouseArea{
      anchors.fill: parent

        onClicked: {
        change()
        changed(parent.num)
        }

        onPressAndHold: {
            changed(parent.num)
            parent.num = 0
        }

        }
}
