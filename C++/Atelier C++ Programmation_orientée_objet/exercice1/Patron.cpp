#include "Patron.h"

Patron::Patron(float chiffre, float pourcentage, std::string nom, std::string prenom, std::string matricule, std::string date_naiss)
    : Employe(nom,prenom,matricule,date_naiss), chiffre_affaire(chiffre), pourcentage(pourcentage){};
    
float Patron::salaire() {
    return chiffre_affaire *(pourcentage/100); 
}  