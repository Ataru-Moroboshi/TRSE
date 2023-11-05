#ifndef LIMAGEAMIGA_H
#define LIMAGEAMIGA_H

#include "source/LeLib/limage/limageqimage.h"
#include "source/LeLib/util/util.h"

class LImageAmiga : public LImageQImage
{
public:
    LImageAmiga(LColorList::Type t, int type);
    void InitPens() override;
    void ExportBin(QFile &file) override;
    virtual void SaveBin(QFile& file) override;
    virtual void LoadBin(QFile& file) override;

    void ExportSubregion(QString outfile, int x, int y, int w, int h, int type) override;

};

#endif // LIMAGEAMIGA4_H
