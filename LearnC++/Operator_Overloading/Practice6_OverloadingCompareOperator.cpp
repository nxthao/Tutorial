#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Vehicle
{
	string m_type;
	string m_model;
public:
	Vehicle(string type, string model)
		: m_type(type), m_model(model)
	{

	}

	friend bool operator==(const Vehicle &a, const Vehicle &b);
	friend bool operator!=(const Vehicle &a, const Vehicle &b);
};

bool operator==(const Vehicle &a, const Vehicle &b)
{
	return (a.m_type == b.m_type && a.m_model == b.m_model);
}

bool operator!=(const Vehicle &a, const Vehicle &b)
{
	return (a.m_type != b.m_type);
}

int main()
{
	Vehicle vehicle1("Car", "Mercedes");
	Vehicle vehicle2("motobike", "Exciter");

	if (vehicle1 == vehicle2)
	{
		cout << "2 Vehicles is the same \n";
	}
	
	if (vehicle1 != vehicle2)
	{
		cout << "2 Vehicles is different \n";
	}
}