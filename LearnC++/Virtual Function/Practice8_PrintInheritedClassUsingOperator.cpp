#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Vehicle
{
public:
    Vehicle()
    {
        cout << "Construct vehicle\n";
    }

    friend  std::ostream& operator<<(std::ostream& out, Vehicle* v)
    {
        return v->print(out);
    }

    virtual std::ostream& print(std::ostream& out)
    {
        out << "Vahicle \n";
        return out;
    }

    ~Vehicle()
    {
        cout << "Destruct vehicle\n";
    }
    
};

class Car : public Vehicle
{
public:
    Car()
    {
        cout << "Construct car\n";
    }

    virtual std::ostream& print(std::ostream& out)
    {
        out << "Car\n";
        return out;
    }

    ~Car()
    {
        cout << "Destruct car\n";
    }
    
};
int main()
{
    Car car;
    Vehicle *vehicle = &car;
    cout << "Name vehicle: " << vehicle << endl;
}