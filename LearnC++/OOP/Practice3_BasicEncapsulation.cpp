#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Ball
{
private:
	string m_color;
	float m_radius;

public:
	Ball()
	{
		m_color = "black";
		m_radius = 10.0;
	}

	Ball(string color, float radius)
	{
		m_color = color;
		m_radius = radius;
	}

	Ball(float radius)
	{
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

	Ball blue('Blue');
	blue.print();

	Ball seven(7);
	seven.print();

	Ball ball("White", 20);
	ball.print();
	return 0;
}
