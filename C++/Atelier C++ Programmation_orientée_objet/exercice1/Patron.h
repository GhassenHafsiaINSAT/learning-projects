#include "Employe.h"

class Patron : public Employe{

    protected: 
        float chiffre_affaire; 
        float pourcentage; 

    public:
        Patron(float chiffre_affaire, float pourcentage, std::string nom, std::string prenom, std::string matricule, std::string date_naiss); 
        float salaire() override;
}; 

    