#include "Mammifere.h"

class chat : public mammifere {
    public: 
        chat(std::string nom); 
        void pousse_cri() override; 
}; 
