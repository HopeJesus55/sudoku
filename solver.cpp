#include "solver.h"
#include <QFile>
#include <cstdlib>

Solver::Solver(QObject *parent) : QObject(parent)
{

}

QVector<int> Solver::victConf()
{
    QVector<int> victbricks = {
        4, 3, 5, 2, 6, 9, 7, 8, 1,
        6, 8, 2, 5, 7, 1, 4, 9, 3,
        1, 9, 7, 8, 3, 4, 5, 6, 2,
        8, 2, 6, 1, 9, 5, 3, 4, 7,
        3, 7, 4, 6, 8, 2, 9, 1, 5,
        9, 5, 1, 7, 4, 3, 6, 2, 8,
        5, 1, 9, 3, 2, 6, 8, 7, 4,
        2, 4, 8, 9, 5, 7, 1, 3, 6,
        7, 6, 3, 4, 1, 8, 2, 5, 9,
    };

    return victbricks;
}

QVector<int> Solver::victConf2()
{
    QVector<int> victbricks = {
        5, 2, 1, 9, 7, 3, 6, 4, 8,
        4, 9, 3, 6, 8, 5, 7, 2, 1,
        7, 8, 6, 1, 2, 4, 5, 3, 9,
        9, 7, 5, 2, 4, 8, 1, 6, 3,
        6, 1, 4, 7, 3, 9, 2, 8, 5,
        2, 3, 8, 5, 1, 6, 4, 9, 7,
        1, 6, 2, 3, 9, 7, 8, 5, 4,
        3, 4, 7, 8, 5, 2, 9, 1, 6,
        8, 5, 9, 4, 6, 1, 3, 7, 2,
    };

    return victbricks;
}

QVector<int> Solver::firstStart()
{
    QVector<int> bricks = victConf();

    deletion(&bricks, 0);

    return bricks;
}


QVector<int> Solver::newPuzzle()
{
    QVector<int> bricks = victConf2();

    deletion(&bricks, 0);

    return bricks;

}

void Solver::deletion(QVector<int>* bricks, int i)
{
  srand (time(NULL));
    int it;

    for(i=0; i<81; i++) {
       it = rand() % 10 + 1;
       if(it>6) bricks->replace(i, 0);
   }

    return;
}


QVector<bool> Solver::pregiven(QVector<int> bricks)
{
   QVector<bool> pregivens;

   for (int i =0; i < 81; i++) {
        pregivens.push_back(false); }

    for (int i =0; i < 81; i++){
        if(bricks[i] != 0)
        pregivens.insert(i, true);
    };

    return pregivens;
}

int Solver::check(QVector<int> victbricks, QVector<int> bricks)
{
    int flag = 1;
    for(int i = 0; i < 81; i++)
    {
        if(victbricks[i] != bricks[i])
        {
            flag = 0;
            break;
        }
    }

    return flag;
}

