#include <iostream>

class fraction 
{
    private: 
        int num; 
        int den; 
    public: 
        fraction(); 
        fraction(int num, int den);
        int getNum();
        int getDen(); 
        void setFraction(int n, int d);
        void somme(fraction& f1, fraction& f2);           
        int simplification(fraction& other);
        fraction operator+(const fraction& other) const; 
        friend std::ostream& operator<<(std::ostream& os, const fraction& other); 
        friend fraction operator++(const fraction& other); 
}; 

