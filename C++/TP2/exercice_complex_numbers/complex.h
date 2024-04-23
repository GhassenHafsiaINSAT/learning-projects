#ifndef COMPLEX_H
#define COMPLEX_H

#include <string>
#include <iostream>

class complex
{
    public:
        int re; 
        int im; 
    public:
        complex(int re, int im);
        complex();
        void affiche_complex(); 
        complex somme_complexe(const complex &a, const complex &b); 
};

#endif // COMPLEX_H