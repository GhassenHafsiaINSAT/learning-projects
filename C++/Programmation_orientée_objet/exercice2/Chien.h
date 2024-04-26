#include "Mammifere.h"

class chien : public mammifere {
    public: 
        chien(std::string nom); 
        void pousse_cri() override; 

};