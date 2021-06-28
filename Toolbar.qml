import QtQuick 2.12
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.12
import QtQuick.Dialogs 1.2

RowLayout {
    signal newpuzzle()
    signal quit()

    Button{
        id: newpuzzlebutton
        text: "New puzzle"
        onClicked: newpuzzle()
    }

    Rectangle{
        id: timerField
        Layout.fillWidth: true
        color: "black"
        property int countdown: 0
        Text {
            id: time
            text: "Timer: " +  timerField.countdown
            font.pointSize: 14
            anchors.centerIn: parent
        }

        Timer {
            id: timer
            interval: 1000 // обновляем часы каждую секунду
            running: true
            repeat: true
            onTriggered: {
                timerField.countdown++
                time.text = "Timer: " +  timerField.countdown
            }
        }
    }

    Button{
        id: quitbutton
        text: "Quit"
        onClicked: quit()
        }


    function winner(){
        timer.stop()
        messagewin.visible=true
    }

    Dialog {
        id: messagewin
        visible: false
        title: "Sudoku!!"
        contentItem:
        ColumnLayout{
            spacing: 2
            Rectangle {
                color: "#B5F5C4"
                implicitWidth: 450
                implicitHeight: 50
                    Text {
                    text: "Yay, you win!!! It took you only " + timerField.countdown + " sec."
                    anchors.centerIn: parent
                    }
                }

            RowLayout{
                spacing: 2
                Button{
                    Layout.fillWidth: true
                    text: "New puzzle!"
                    palette {
                            button: "#B5F5C4"
                        }
                    onClicked: {
                        timer.stop()
                        timerField.countdown = 120
                        timer.start()
                        time.text = "Timer: " +  timerField.countdown
                        messagewin.visible=false
                        newpuzzle()
                    }
                }

                Button{
                    Layout.fillWidth: true
                    text: "Thats enough sudoku for me"
                    palette {
                            button: "#B5F5C4"
                        }
                    onClicked: {
                        messagewin.visible=false
                        quit()
                    }
                }
            }
        }
    }

    }

