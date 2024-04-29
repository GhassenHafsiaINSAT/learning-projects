#include "Rectangle.h"

Rectangle::Rectangle(): longueur(0),largeur(0){} 
Rectangle::Rectangle(int longueur, int largeur)
: longueur(longueur),largeur(largeur){}

float Rectangle::perimetre()
{
    float perimetre = (this->largeur+this->longueur)*2; 
    return perimetre; 
}

float Rectangle::surface()
{
    float surface = (this->longueur)*(this->largeur); 
    return surface; 
}