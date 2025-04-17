#ifndef POSTOPTIMIZERX86_H
#define POSTOPTIMIZERX86_H

#include "postoptimiser.h"

class PostOptimiserZ80 : public PostOptimiser
{
public:
    PostOptimiserZ80();
    QStringList m_axModifiers;
    QHash<QString, QString> m_lastMemoryStoredValue;
    void InitRegisters();

    QString prevCmd="";
    QStringList prevPar;
    SourceLine* prevLine = nullptr;

    void Analyze(SourceLine& line);
    void ChangeReg(SourceLine& line, QString reg, QString val);
};

#endif // POSTOPTIMIZERX86_H
