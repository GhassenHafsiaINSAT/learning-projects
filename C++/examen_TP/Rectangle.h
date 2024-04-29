#ifndef Rect_h
#define Rect_h

#include "FormeFigure.h"

class Rectangle : public FormeFigure
{
    protected: 
        int longueur;
        int largeur; 
    
    public: 
        Rectangle(); 
        Rectangle(int m, int n); 
        float perimetre() override; 
        float surface() override; 
}; 

#endif //Rect_h