#include "pch.h"
#include <iostream>
#include "Point3d.h"
#include "Vector3d.h"

using namespace std;

Point3d::Point3d(int x, int y, int z)
	: m_x(x), m_y(y), m_z(z)
{

}

void Point3d::moveByVector(const Vector3d &vector)
{
	m_x += vector.m_vx;
	m_y += vector.m_vy;
	m_z += vector.m_vz;
}

void Point3d::display()
{
	cout << "coordinate of point: " << endl;
	cout << "x: " << m_x << endl;
	cout << "y: " << m_y << endl;
	cout << "z: " << m_z << endl;
}
