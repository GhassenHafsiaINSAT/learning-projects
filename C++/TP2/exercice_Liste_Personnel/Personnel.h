#pragma once
#include <iostream>

class Personnel
{
private:
    std::string nom; 
    std::string prenom; 
public:
    Personnel(std::string nom ,std::string prenom);
    friend std::ostream& operator<<(std::ostream& os, Personnel& other); 
};

