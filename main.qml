import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.12
Window {
    id: w
     visible: true

    minimumWidth: 700
    maximumWidth: 700
    width: 700

    minimumHeight: cl.height
    maximumHeight: cl.height
    height: cl.height


    title: qsTr("Sudoku!")

    ColumnLayout {
        id: cl

        anchors.centerIn: w.contentItem
        spacing: 2
        Gameplay {
            id: gameplay
            onWinner:
                toolbar.winner()
            //newPuzzle()
        }
        Toolbar {
            id: toolbar
            onNewpuzzle: gameplay.newPuzzle()
            onQuit: Qt.quit()
        }
    }

    Rectangle {y:0; x: 77; height: 544;width: 3;color: "black"}
    Rectangle {y:0; x: 258; height: 544;width: 3;color: "black"}
    Rectangle {y:0; x: 439; height: 544;width: 3;color: "black"}
    Rectangle {y:0; x: 620; height: 544;width: 4;color: "black"}
    Rectangle {y:0; x: 76; height: 3;width: 546;color: "black"}
    Rectangle {y:180; x: 76; height: 3;width: 546;color: "black"}
    Rectangle {y:363; x: 76; height: 3;width: 546;color: "black"}
    Rectangle {y:544; x: 76; height: 3;width: 546;color: "black"}

}
