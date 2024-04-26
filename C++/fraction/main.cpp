#include "fraction.h"

int main()
{
    fraction f1(2,3);
    fraction f2(4,9); 
    fraction f3 = f1+f2;
    std::cout <<"Den : " <<f3.getDen()<<"Num : "<<f3.getNum() <<std::endl; 
    std::cout<<f3<<std::endl; 
    return 0;
}


