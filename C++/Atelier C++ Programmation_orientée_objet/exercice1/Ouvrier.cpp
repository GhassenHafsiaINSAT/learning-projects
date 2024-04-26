#include "Ouvrier.h"

Ouvrier::Ouvrier(float acc,std::string date_entre, std::string nom, std::string prenom, std::string matricule, std::string date_naiss)
    : Employe(nom,prenom,matricule,date_naiss), accidente_en_ann(acc),date_entre(date_entre){};

float Ouvrier::salaire() {
    return SMIG + accidente_en_ann*100; 
}  