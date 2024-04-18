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

class ouvrier : public Employe{
    
    protected: 
        std::string date_entre; 
        const int SMIG = 2500; 
        float accidente_en_ann; 
    public: 
        ouvrier(float Acc,std::string date_entre, std::string nom, std::string prenom, std::string matricule, std::string date_naiss); 
        float salaire() override;
}; 

class cadre : public Employe{
    protected : 
        int indice; 

    public: 
        cadre(int indice, std::string nom, std::string prenom, std::string matricule, std::string date_naiss); 
        float salaire() override;
}; 

class patron : public Employe{

    protected: 
        float chiffre_affaire; 
        float pourcentage; 

    public:
        patron(float chiffre_affaire, float pourcentage, std::string nom, std::string prenom, std::string matricule, std::string date_naiss); 
        float salaire() override;
}; 
