#include <string>
#include <iostream>
class Employe{
    
    protected: 
    std::string Matricule; 
    std::string Nom; 
    std::string Prenom; 
    std::string Date_De_Naissance;  
    
    public:   
    Employe(std::string matricule, std::string nom, std::string prenom, std::string date_de_naissance); 
    
    std::string GetNom();
    std::string GetPrenom();
    std::string GetDateDeNaissance();
    std::string GetMatricule();
    
    void setNom(std::string  nom);
    void setPrenom(std::string  prenom);
    void setMatricule(std::string  matricule);
    void setDateDeNaissance(std::string  date_de_naissance);

    std::string ToString();

    virtual float salaire(); 

};



