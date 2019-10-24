#include "pch.h"
#include <iostream>

using namespace std;

class Point
{
	int m_x;
	int m_y;
	int m_z;
public:
	Point(int x = 0, int y = 0, int z = 0)
		: m_x(x), m_y(y), m_z(z)
	{

	}

	Point operator-() const;

	bool operator!() const;

};

Point Point::operator-() const
{
	return Point(-m_x, -m_y);
}

bool Point::operator!() const
{
	return ((m_x == 0 ) && (m_y == 0) && (m_z == 0)) ? 1 : 0;
}

int main()
{
	Point point1;
	//  integers will return true for an integer value of 0 and false otherwise.
	if (!point1)
	{
		cout << "The point is origin \n";
	}
	else 
	{
		cout << "The point is changed \n";
	}

	Point point2(1, 5, 10);

	if (!point2)
	{
		cout << "The point is origin \n";
	}
	else 
	{
		cout << "The point is changed \n";
	}

	return 0;
}