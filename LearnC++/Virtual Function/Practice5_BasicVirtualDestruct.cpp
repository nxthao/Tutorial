#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Vehicle
{
protected:
    string m_name;
public:
    Vehicle(string name)
        : m_name(name)
    {
        cout << "Construct Vehicle\n";
    }

    string getName()
    {
        return m_name;
    }

    virtual ~Vehicle()
    {
        cout << "Destruct Vehicle\n";
    }
};

class Car : public Vehicle
{
    int *m_number;
public:
    Car(string name, int number)
        : Vehicle(name)
    {
		cout << "Construct Car \n";
        m_number = new int;
        *m_number = number;
    }

    string getName()
    {
        return m_name;
    }

    int getNumber()
    {
        return *m_number;
    }

    virtual ~Car()
    {
        cout << "Destruct Car\n";
        delete m_number;
    }
};

int main()
{
    Car car("mercedes", 2);
    cout << "Name: " << car.getName() << " Quantity: " << car.getNumber() << endl;

    Vehicle *vehicle =&car;
    cout << "Name: " << vehicle->getName() << endl;
    delete vehicle;
    return 0;
}