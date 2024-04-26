#include "Employe.h"

class Ouvrier : public Employe{
    
    protected: 
        std::string date_entre; 
        const int SMIG = 2500; 
        float accidente_en_ann; 
    public: 
        Ouvrier(float Acc,std::string date_entre, std::string nom, std::string prenom, std::string matricule, std::string date_naiss); 
        float salaire() override;
}; 
