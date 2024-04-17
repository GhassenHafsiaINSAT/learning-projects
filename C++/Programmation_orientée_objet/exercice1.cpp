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

std::string ToString(){

}
    
