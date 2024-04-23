#include "complex.h"

complex::complex(int re, int im) : re(re),im(im){}

complex::complex() : re(0),im(0){}

void complex::affiche_complex() {
    re = re; 
    im = im; 
    std::cout << re << " + i" << im << std::endl;
}

complex complex::somme_complexe(const complex &a, const complex &b){
    int new_re = a.re + b.re; 
    int new_im = a.im + b.im;
    return complex(new_re,new_im);
}