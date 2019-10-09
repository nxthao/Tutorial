#include "pch.h"
#include <iostream>

using namespace std;

class Point3d
{
	int m_x;
	int m_y;
	int m_z;
public:
	void setValue(int x, int y, int z)
	{
		m_x = x;
		m_y = y;
		m_z = z;
	}

	void print()
	{
		cout << "x: " << m_x << endl;
		cout << "y: " << m_y << endl;
		cout << "z: " << m_z << endl;
	}

	bool isEqual(const Point3d &tmp)
	{
		if ((tmp.m_x == m_x) && (tmp.m_y == m_y) && (tmp.m_z == m_z))
		{
			return 1;
		}
		else
		{
			return 0;
		}

	}
};

int main()
{
	Point3d point1;
	point1.setValue(2, 5, 7);
	point1.print();

	Point3d point2;
	point2.setValue(2,5,7);
	point2.print();
	if (point1.isEqual(point2))
	{
		cout << "point1 is equal point2 \n";
	}
	else
	{
		cout << "point1 is not equal point2 \n";
	}

	Point3d point3;
	point3.setValue(3,5,8);
	if (point1.isEqual(point3))
	{
		cout << "point1 is equal point3 \n";
	}
	else
	{
		cout << "point1 is not equal point3 \n";
	}
}