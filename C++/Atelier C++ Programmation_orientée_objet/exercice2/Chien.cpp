#include "Chien.h"

chien::chien(std::string nom) : mammifere(nom){}

void chien::pousse_cri(){
    std::cout << "ouah ouah" << std::endl; 
}