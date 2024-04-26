#include "Employe.h"

class Cadre : public Employe{
    protected : 
        int indice; 

    public: 
        Cadre(int indice, std::string nom, std::string prenom, std::string matricule, std::string date_naiss); 
        float salaire() override;
}; 