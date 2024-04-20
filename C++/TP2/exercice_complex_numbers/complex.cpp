#include "complex.h"

complex::complex(int re, int im) : re(re), im(im){}

complex::complex() : re(0), im(0) {}

void complex::affiche_complex() {
    re = re; 
    im = im; 
    std::cout << re << " + i" << im << std::endl;
}

complex complex::somme_complexe(complex a, complex b){
    re = a.re + b.re; 
    im = a.im + b.im;
}


