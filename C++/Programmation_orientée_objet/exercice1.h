#include <string>
//using namespace std; 
class Employe{
    protected: 
    std::string Matricule; 
    std::string Nom; 
    std::string Prenom; 
    std::string Date_De_Naissance;  
    public:   
    Employe(std::string matricule, std::string nom, std::string prenom, std::string date_de_naissance) : Matricule(matricule),Nom(nom),Prenom(prenom),Date_De_Naissance(date_de_naissance){}; 
    std::string GetMatricule() {
        return Matricule;
    }
    std::string GetNom() {
        return Nom;
    }
    std::string GetPrenom() {
        return Prenom;
    }
    std::string GetDateDeNaissance(){
        return Date_De_Naissance;
    }
    void setMatricule(std::string  matricule){
        this->Matricule = matricule;
    }
    void setNom(std::string  nom){
        this->Nom = nom;
    }
    void setMatricule(std::string  prenom){
        this->Prenom = prenom;
    }
    void setMatricule(std::string  date_de_naissance){
        this->Date_De_Naissance = date_de_naissance;
    }
    std::string ToString(){

    }
    virtual float Getsalaire(); 
    
};