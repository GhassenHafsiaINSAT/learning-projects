#include <iostream>
#include "Rectangle.h"
#include "Cercle.h"

int main()
{
    Cercle c1(3); 
    std::cout<<"Le périmetre du cercle est" << c1.perimetre() << std::endl; 
    std::cout<<"La surface du cercle est" << c1.surface() << std::endl; 
    Rectangle r1(3,4); 
    std::cout<<"Le périmetre du rectangle est" << r1.perimetre() << std::endl; 
    std::cout<<"La surface du rectangle est" << r1.surface() << std::endl; 
    return 0; 
}