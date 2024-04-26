#include "Souris.h"

souris::souris(std::string nom) : mammifere(nom){}

void souris::pousse_cri(){
    std::cout <<"couic couic"<<std::endl;
}
