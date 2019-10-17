#include "pch.h"
#include <iostream>

using namespace std;

class Vector3D
{
	int m_vx;
	int m_vy;
	int m_vz;
public:
	Vector3D(int x, int y, int z)
		: m_vx(x), m_vy(y), m_vz(z)
	{

	}

	friend class Point3D; // a Friend of class 
};

class Point3D
{
	int m_x;
	int m_y;
	int m_z;
public:
	Point3D(int x, int y, int z)
		: m_x(x), m_y(y), m_z(z)
	{

	}

	void moveByVector(Vector3D& vector)
	{
		m_x += vector.m_vx;
		m_y += vector.m_vy;
		m_z += vector.m_vz;
	}

	void display()
	{
		cout << "Cordiante of point: " << endl;
		cout << "x: " << m_x << endl;
		cout << "y: " << m_y << endl;
		cout << "z: " << m_z << endl;
	}
};

int main()
{
	Point3D point(1, 2, 3);
	Vector3D vector(2, 0, 0);
	point.display();
	point.moveByVector(vector);
	point.display();	
}