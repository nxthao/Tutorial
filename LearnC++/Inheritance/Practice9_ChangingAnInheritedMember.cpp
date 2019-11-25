#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Vehicle
{
private:
    string m_type;
public:
    Vehicle(string type = " ")
        : m_type(type)
    {

    }
protected:
    void display()
    {
        cout << "Type vehicle: " << m_type << endl;
    }
};

class Car : public Vehicle
{
public:
    string m_name;
    Car (string type = " ", string name = " ")
        : Vehicle(type), m_name(name)
    {

    }

    using Vehicle::display;
};

int main()
{
    Car car("Car", "Mercedes");
    car.display();
    cout << "Type car: " << car.m_name << endl;
    return 0;
}