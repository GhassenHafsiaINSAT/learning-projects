#include "Liste_Personnel.h"
#include <iostream>
#include <iterator>

void Liste_Personnel::Remplir_Liste_Personnel()
{   char response; 
    do {
        std::string nom, prenom; 
        std::cout << "donnez nom : " <<std::endl; 
        std::cin >> nom; 
        std::cout << "donnez prenom : " << std::endl; 
        std::cin >> prenom; 
        v.push_back(Personnel(nom,prenom));
        std::cout<<"voulez vous continuez (O/N)?" <<std::endl; 
        std::cin>>response; 
    } while ((response == 'O') || (response == 'o'));   
}

void Liste_Personnel::affiche_liste()
{   
    std::vector<Personnel>::iterator i; 
    for(i=this->v.begin(); i <this->v.end(); i++)
        std::cout<<*i << " "; 
}

