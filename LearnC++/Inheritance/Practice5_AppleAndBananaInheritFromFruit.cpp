#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Fruit
{
	string m_name;
	string m_color;
public:
	Fruit(string name = " ", string color = " ")
		: m_name(name), m_color(color)
	{

	}

	const string getName() const 
	{
		return m_name;
	}
	const string getColor() const
	{
		return m_color;
	}
};

class Apple : public Fruit
{
	double m_fiber;
public:
	Apple(string name, string color, double fiber = 0.0)
		: Fruit(name, color), m_fiber(fiber)
	{

	}

	friend std::ostream& operator<<(std::ostream& out, const Apple apple);
};

class Banana : public Fruit
{
public:
	Banana(string name, string color)
		: Fruit(name, color)
	{

	}

	friend std::ostream& operator<<(std::ostream& out, const Banana banana);
};

std::ostream& operator<<(std::ostream& out, const Apple apple)
{
	out << "Apple(" << apple.getName() << ", " << apple.getColor() << ", " << apple.m_fiber << ")\n";
	return out;
}

std::ostream& operator<<(std::ostream& out, const Banana banana)
{
	out << "Banana(" << banana.getName() << ", " << banana.getColor() << ")\n";
	return out;
}

int main()
{
	const Apple a("Red delicious", "Red", 4.2);
	cout << a;

	const Banana b("Cavendish", "Yellow");
	cout << b;
	return 0;
}