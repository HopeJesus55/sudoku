import QtQuick 2.15
import QtQuick.Layouts 1.12
import QtQuick.Shapes 1.12

GridLayout {
    id: gl
    width: 700
    height: 700
    columns: 9
    rows: 9

    columnSpacing: 1
    rowSpacing: 1

    signal winner;
    property int gflag: 0


    function firstStart()
    {
    var firstStartConfigs = solver.firstStart()
    for( var i = 0; i < firstStartConfigs.length; i++)
        bricks.itemAt(i).num = firstStartConfigs[i]

    pregiven()
    win()
    }

    function win()
    {
       var victConfigs = []
        if(gflag>0)
        victConfigs = solver.victConf2()
        else victConfigs = solver.victConf()

        var brickConfigs = []
        for(var i = 0; i < bricks.count; i++)
            brickConfigs.push(bricks.itemAt(i).num)

        var win = solver.check(victConfigs, brickConfigs)
        if (win===1)
            winner()
    }

    function newPuzzle()
    {
    gflag++

    var newPuzzleConfigs = solver.newPuzzle()
    for( var i = 0; i < newPuzzleConfigs.length; i++)
        bricks.itemAt(i).num = newPuzzleConfigs[i]

    pregiven()
    win()
    }

    function pregiven()
    {
        var brickConfigs = []
        if (gflag>0) brickConfigs = solver.newPuzzle()
         else brickConfigs = solver.firstStart()

        var bricklight = {}
        bricklight = solver.pregiven(brickConfigs)

       for(var k = 0; k < bricklight.length; k++)
           bricks.itemAt(k).pregiven = bricklight[k]

    }
    Repeater {
        id: bricks
        model: 81

        Brick {
            onChanged: gl.win()

    }
}


    Component.onCompleted: {
        firstStart()
    }

}
