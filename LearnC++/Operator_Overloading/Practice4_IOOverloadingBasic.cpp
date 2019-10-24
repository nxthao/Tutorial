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

	friend std::ostream& operator<<(std::ostream &out, const Point &p);
	friend std::istream& operator>>(std::istream &in, Point &p);

};

std::ostream& operator<<(std::ostream &out, const Point &p)
{
	out << "Point(" << p.m_x << " , " << p.m_y << " , " << p.m_z << " ) \n";
	return out;
}

std::istream& operator>>(std::istream &in, Point &p)
{
    // Since operator>> is a friend of the Point class, we can access Point's members directly.
    // note that parameter point must be non-const so we can modify the class members with the input values
	in >> p.m_x;
	in >> p.m_y;
	in >> p.m_z;
	return in;
}


int main()
{
	Point point1(2, 3 ,4);
	cout << point1;
	Point point2;
	cout << "Please enter point \n";
	cin >> point2;
	cout << "Show the point\n";
	cout << point2;
	return 0;
}