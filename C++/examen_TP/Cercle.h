#ifndef Cercle_h
#define Cercle_h

#include "FormeFigure.h"
class Cercle : public FormeFigure
{
    protected: 
        int r;
    public: 
        Cercle(); 
        Cercle(int r); 
        float perimetre() override; 
        float surface() override; 
}; 

#endif //Cercle_h