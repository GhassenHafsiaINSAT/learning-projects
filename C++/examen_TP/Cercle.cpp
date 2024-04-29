#include "Cercle.h"

Cercle::Cercle(): r(0){};
Cercle::Cercle(int r): r(r){};  

float Cercle::perimetre(){
    float perimetre = 3.14*2*(this->r); 
    return perimetre; 
}

float Cercle::surface(){
    float surface = 3.14*(this->r)*(this->r); 
    return surface; 
}