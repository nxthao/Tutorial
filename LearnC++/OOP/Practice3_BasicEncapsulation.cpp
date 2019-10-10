#include "pch.h"
#include <iostream>
#include <string>
/*
Note: Overload. Should move a little argument function to at the begin
of the class
*/

using namespace std;

class Ball
{
	string m_color;
	double m_radius;

public:
	Ball(double radius)
	{
		m_radius = radius;
		m_color = "black";
	}

	Ball(string color = "black", double radius = 10.0)
	{
		m_color = color;
		m_radius = radius;
	}

	void print()
	{
		cout << "Color: " << m_color << endl;
		cout << "Radius: " << m_radius << endl;
	}
};

int main()
{
	Ball def;
    def.print();

	Ball blue("Blue");
	blue.print();

	Ball seven(7);
	seven.print();

	Ball ball("White", 20);
	ball.print();
	return 0;
}
