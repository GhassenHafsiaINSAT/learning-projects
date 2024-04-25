#include <vector>
#include "Personnel.h"

class Liste_Personnel
{
private:
    std::vector<Personnel> v; 
public:
    void Remplir_Liste_Personnel();
    void affiche_liste(); 
};
