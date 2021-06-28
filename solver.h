#ifndef SOLVER_H
#define SOLVER_H

#include <QObject>
#include <QVector>


class Solver : public QObject
{
    Q_OBJECT
public:
    explicit Solver(QObject *parent = nullptr);

signals:

private:

public slots:
    QVector<int> victConf();
    QVector<int> victConf2();
    QVector<int> newPuzzle();
    QVector<int> firstStart();
    QVector<bool> pregiven(QVector<int> bricks);

    int check(QVector<int> victbricks, QVector<int> bricks);
    void deletion(QVector<int>* bricks, int i);
};

#endif // SOLVER_H
