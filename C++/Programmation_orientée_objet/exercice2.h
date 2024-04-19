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

class mammifere : public animal {
    public: 
        mammifere(std::string nom);
        virtual void pousse_cri() override; 

}; 

class chien : public mammifere {
    public: 
        chien(std::string nom); 
        void pousse_cri() override; 

};

class chat : public mammifere {
    public: 
        chat(std::string nom); 
        void pousse_cri() override; 
}; 

class souris : public mammifere{
    public: 
        souris(std::string nom);
        void pousse_cri() override;  
}; 

class oiseau : public animal{
    public: 
        oiseau(std::string nom); 
        void pousse_cri() override; 
};

class canari : public oiseau{
    public: 
        canari(std::string nom); 
        void pousse_cri() override; 
}; 