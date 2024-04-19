#include "exercice2.h"

animal::animal(std::string nom) : nom(nom){}

std::string animal::getNom(){
    return nom; 
}

void animal::setNom(std::string nom){
    this->nom = nom; 
}

void animal::pousse_cri(){
    std::cout << "The animal makes a sound"<< std::endl; 
}

mammifere::mammifere(std::string nom) : animal(nom){}

oiseau::oiseau(std::string nom) : animal(nom){}

chien::chien(std::string nom) : mammifere(nom){}

void chien::pousse_cri(){
    std::cout << "ouah ouah" << std::endl; 
}

chat::chat(std::string nom) : mammifere(nom){}

void chat::pousse_cri(){
    std::cout <<"miaou miaou"<<std::endl;
}

souris::souris(std::string nom) : mammifere(nom){}

void souris::pousse_cri(){
    std::cout <<"couic couic"<<std::endl;
}
canari::canari(std::string nom) : oiseau(nom){}

void canari::pousse_cri(){
    std::cout <<"cui cui"<<std::endl; 
}






