#include "pch.h"
#include <iostream>

using namespace std;

class Point
{
	int m_value;
public:
	Point(int value = 0)
		: m_value(value)
	{

	}
	friend Point operator+(Point& value1, Point& value2);
	Point operator-() const;
	Point operator=(int value);

	friend std::ostream& operator<<(std::ostream &out, Point &value);
};

Point Point::operator-() const
{
	return (-m_value);
}

Point operator+(Point &value1, Point &value2)
{
	return value1.m_value + value2.m_value;
}

Point Point::operator=(int value)
{
	m_value = value;
	return *this;
}

std::ostream& operator<<(std::ostream &out, Point &value)
{
	out << "Value: " << value.m_value << endl;
	return out;
}

int main()
{
	Point point1(2);
	cout << point1 << endl;
	Point point2(5);
	cout << point2 << endl;
	Point point3 = point1 + point2;
	cout << point3 << endl;

	Point point4 = -point3;
	cout << point4 << endl;

	Point point5 = 10;
	cout << point5 << endl;

	return 0;
}