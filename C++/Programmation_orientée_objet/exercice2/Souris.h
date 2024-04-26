#include "Mammifere.h"

class souris : public mammifere{
    public: 
        souris(std::string nom);
        void pousse_cri() override;  
}; 