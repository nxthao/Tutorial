#include "pch.h"
#include <iostream>

using namespace std;

class Vector3D;

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

	void moveByVector(const Vector3D &vector);
	// note: we can't define this function here, because Vector3d hasn't been declared yet (just forward declared)

	void display()
	{
		cout << "Cordiante of point: " << endl;
		cout << "x: " << m_x << endl;
		cout << "y: " << m_y << endl;
		cout << "z: " << m_z << endl;
	}
};

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

	friend void Point3D::moveByVector(const Vector3D &vector); // a Friend of function 
};

// Now that Vector3d has been declared, we can define the function Point3d::moveByVector()
void Point3D::moveByVector(const Vector3D &vector)
{
	m_x += vector.m_vx;
	m_y += vector.m_vy;
	m_z += vector.m_vz;
}

int main()
{
	Point3D point(1, 2, 3);
	Vector3D vector(4, 5, 6);
	point.display();
	point.moveByVector(vector);
	point.display();	
}