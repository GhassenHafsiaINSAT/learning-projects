#include <iostream>
#include <iomanip>


class Time
{
protected:
    int hours; 
    int minutes; 
    int secondes; 
public:
    Time(int hours, int minutes, int seconds);
    Time();
    void getTime(); 
    int getHours(); 
    int getMinutes(); 
    int getSecondes(); 
    void addTime(const Time& T1, const Time& T2);
};

