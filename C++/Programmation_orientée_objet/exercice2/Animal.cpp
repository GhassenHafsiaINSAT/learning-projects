#include "Animal.h"

animal::animal(std::string nom) : nom(nom){}

std::string animal::getNom(){
    return nom; 
}

void animal::setNom(std::string nom){
    this->nom = nom; 
}













