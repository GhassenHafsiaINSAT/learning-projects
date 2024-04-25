#include "Time.h"

#include <iostream>
#include <iomanip>

Time::Time(int hours, int minutes, int seconds) 
: hours(hours), minutes(minutes), secondes(seconds){}

Time::Time() : hours(0), minutes(0), secondes(0){}

int Time::getHours(){
    return hours; 
}

int Time::getMinutes(){
    return minutes; 
}

int Time::getSecondes(){
    return secondes; 
}

void Time::getTime(){
    int hour = this->hours; 
    int minute  = this->minutes; 
    int second = this->secondes; 
    std::cout << std::setw(2) << std::setfill('0') << hour << ":" // Met à jour la largeur de l'affichage et le rembourrage avec des zéros
        << std::setw(2) << std::setfill('0') << minute << ":" 
        << std::setw(2) << std::setfill('0') << second;

}

void Time::addTime(const Time& T1,const Time& T2){
    int seconde = T1.secondes + T2.secondes; 
    int carry_minutes = seconde/60; 
    this->secondes = seconde % 60; 
    int minute = T1.minutes + T2.minutes + carry_minutes; 
    int carry_hours = minute/60; 
    this->minutes = minute % 60; 
    int hour = T1.hours + T2.hours + carry_hours;
    this->hours = hour % 24;  
}


