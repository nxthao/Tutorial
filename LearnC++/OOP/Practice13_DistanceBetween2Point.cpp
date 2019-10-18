#include "pch.h"
#include <iostream>
#include <cmath>

using namespace std;

class  Point2d
{
	double m_x;
	double m_y;
public:
	Point2d(double x = 0.0, double y = 0.0)
		:m_x(x), m_y(y)
	{

	}

	void display()
	{
		cout << "Coordinate: x: " << m_x << " y: " << m_y << endl;
	}

	double distanceTo(const Point2d &p)
	{
		double d;
		d = sqrt((m_x - p.m_x)*(m_x - p.m_x) + (m_y - p.m_y)*(m_y - p.m_y));
		return d;
	}
};

int main()
{
	Point2d point1;
	point1.display();
	Point2d point2(1.0, 2.0);
	point2.display();
	cout << "distance from point1 to point2: " << point1.distanceTo(point2) << endl;
	return 0;
}