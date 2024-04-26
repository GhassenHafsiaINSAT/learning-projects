#include <string>
#include <iostream>

class animal {
    
    protected: 
        std::string nom;
    public: 
        animal(std::string nom); 
        std::string getNom(); 
        void setNom(std::string nom); 
        virtual void pousse_cri(); 

}; 









