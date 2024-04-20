#include <string>
#include <iostream>

class complex
{
    private:
        int im; 
        int re; 
    public:
        complex(int re, int im);
        complex();
        void affiche_complex(); 
        complex somme_complexe(complex a, complex b); 
};

