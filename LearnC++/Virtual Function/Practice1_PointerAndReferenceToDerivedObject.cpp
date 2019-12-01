#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Vehicle
{
protected:
    string m_name;
    int m_value;
public:
    Vehicle(string name = "vehicle", int value = 1)
        : m_name(name), m_value(value)
    {

    }

    string getName()
    {
        return m_name;
    }

    int getValue()
    {
        return m_value;
    }
};

class Car : public Vehicle
{
public:
	Car(string name = "car", int value = 1)
		: Vehicle(name, value)
	{

	}

	string getName()
	{
		return m_name;
	}

	int getValue()
	{
		return m_value*2;
	}
};

int main()
{
    Car mercedes("mercedes", 2);
    cout << "Name: " << mercedes.getName() << " and Value: " << mercedes.getValue() << endl;

    Car &rmercedes = mercedes;
    cout << "Name: " << rmercedes.getName() << " and Value: " << rmercedes.getValue() << endl;

    Car *pmercedes = &mercedes;
    cout << "Name: " << pmercedes->getName() << " and Value: " << pmercedes->getValue() << endl;
    return 0;
}