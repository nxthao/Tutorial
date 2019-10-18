#ifndef VECTOR3D_H
#define VECTOR3D_H

#include "Point3d.h"

class Vector3d
{
	int m_vx;
	int m_vy;
	int m_vz;
public:
	Vector3d(int x, int y, int z);

	friend void Point3d::moveByVector(const Vector3d &vector); // a Friend of function 
};

#endif