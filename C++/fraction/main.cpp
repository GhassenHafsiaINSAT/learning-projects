#include "fraction.h"

int main()
{
    fraction f1(3,4);
    fraction f2(2,3); 
    fraction f3 = f1+f2;
    std::cout<<f3<<std::endl; 
    return 0;
}


