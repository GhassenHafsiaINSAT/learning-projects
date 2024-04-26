#include "Cadre.h"

Cadre::Cadre(int indice, std::string nom, std::string prenom, std::string matricule, std::string date_naiss) 
    : Employe(nom,prenom,matricule,date_naiss), indice(indice){};

float Cadre::salaire() {
    float fin; 
    if (indice == 1) fin = 13000; 
    else if (indice == 2) fin = 15000; 
    else if (indice == 3) fin = 17000; 
    else if(indice == 4) fin = 20000; 
    return fin; 
}  