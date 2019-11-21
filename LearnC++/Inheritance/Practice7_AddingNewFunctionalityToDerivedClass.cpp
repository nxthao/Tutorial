#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Vehicle
{
protected:
    string m_type;
public:
    Vehicle(string type = " ")
        : m_type(type)
    {

    }
};

class Car : public Vehicle
{
    string m_name;
public:
    Car (string type = " ", string name = " ")
        : Vehicle(type), m_name(name)
    {

    }

    string getType()
    {
        return m_type;
    }
};

int main()
{
    Car car("Car", "Mercedes");
    cout << "Vehicle type: " << car.getType() << endl;
    return 0;
}