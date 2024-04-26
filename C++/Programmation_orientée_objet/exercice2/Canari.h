#include "Oiseau.h"

class canari : public oiseau{
    public: 
        canari(std::string nom); 
        void pousse_cri() override; 
}; 