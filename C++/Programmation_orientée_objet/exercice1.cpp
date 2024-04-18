#include "exercice1.h"

Employe::Employe(std::string matricule, std::string nom, std::string prenom, std::string date_de_naissance) 
    : Matricule(matricule),Nom(nom),Prenom(prenom),Date_De_Naissance(date_de_naissance){}; 

std::string Employe::GetMatricule() {
    return Matricule;
}

std::string Employe::GetNom() {
    return Nom;
}

std::string Employe::GetPrenom() {
    return Prenom;
}

std::string Employe::GetDateDeNaissance(){
    return Date_De_Naissance;
}

void Employe::setMatricule(std::string  matricule){
    this->Matricule = matricule;
}

void Employe::setNom(std::string  nom){
    this->Nom = nom;
}

void Employe::setPrenom(std::string  prenom){
    this->Prenom = prenom;
}

void Employe::setDateDeNaissance(std::string  date_de_naissance){
    this->Date_De_Naissance = date_de_naissance;
}

std::string Employe::ToString() {
    return "test"; 
}

float Employe::salaire(){
    return 0.1; 
}

ouvrier::ouvrier(float acc,std::string date_entre, std::string nom, std::string prenom, std::string matricule, std::string date_naiss)
    : Employe(nom,prenom,matricule,date_naiss), accidente_en_ann(acc),date_entre(date_entre){};

float ouvrier::salaire() {
    return SMIG + accidente_en_ann*100; 
}  

cadre::cadre(int indice, std::string nom, std::string prenom, std::string matricule, std::string date_naiss) 
    : Employe(nom,prenom,matricule,date_naiss), indice(indice){};

float cadre::salaire() {
    float fin; 
    if (indice == 1) fin = 13000; 
    else if (indice == 2) fin = 15000; 
    else if (indice == 3) fin = 17000; 
    else if(indice == 4) fin = 20000; 
    return fin; 
}  

patron::patron(float chiffre, float pourcentage, std::string nom, std::string prenom, std::string matricule, std::string date_naiss)
    : Employe(nom,prenom,matricule,date_naiss), chiffre_affaire(chiffre), pourcentage(pourcentage){};
    
float patron::salaire() {
    return chiffre_affaire *(pourcentage/100); 
}      