#include <iostream>
#include <vector>

class Personnel
{
private:
    std::string nom; 
    std::string prenom; 
public:
    Personnel(std::string nom ,std::string prenom);
};


class Liste_Personnel
{
private:
    std::vector<Personnel> v; 
public:
    void Remplir_Liste_Personnel();
    void affiche_liste(); 
};

