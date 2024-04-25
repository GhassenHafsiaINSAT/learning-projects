#include <Personnel.h>

Personnel::Personnel(std::string nom ,std::string prenom) 
    : nom(nom), prenom(prenom){};


std::ostream& operator<<(std::ostream& os, Personnel& other) {
    os << "Nom: " <<other.nom<<", Prenom: "<<other.prenom;  
    return os;
} 