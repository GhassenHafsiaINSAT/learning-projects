#include "fraction.h"
#include <algorithm>

fraction::fraction() : num(0), den(1){}

fraction::fraction(int num,int den) : num(num), den(den){}

int fraction::getNum() {return num;} 
int fraction::getDen() {return den;} 

void fraction::setFraction(int n, int d){
    this->num = n; 
    this->den = d; 
}

int fraction::simplification(fraction& other){
    int final_res = std::__gcd(other.num, other.den); 
    return final_res; 
}

void fraction::somme(fraction& f1, fraction& f2){
    num = f1.num + f2.num;
    den = f1.num + f2.den; 
}

fraction fraction::operator+(const fraction& other) const
{
    fraction resultat; 
    if (den % other.den == 0){
        std::cout<<"true"<<std::endl; 
        resultat.num = num + ((den / other.den)*other.num);
        resultat.den = den; 
    }
    else if (other.den % den == 0)
    {   
        std::cout<<"false"<<std::endl; 
        resultat.num = other.num + ((other.den /den)*num);
        resultat.den = other.den;  
    }
    
    else
    {
        resultat.num = (num)*(other.den) + (other.num)*(den);
        resultat.den = (den)*(other.den); 
    }
    return resultat; 
}    

std::ostream& operator<<(std::ostream& os, const fraction& other)
{
    os <<"num : "<<other.num<<", den : "<<other.den;  
    return os; 
}