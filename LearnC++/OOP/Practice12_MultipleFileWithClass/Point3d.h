#ifndef POINT3D_H
#define POINT3D_H
// Note: I only include library when I use member of  .h file
// #include "Vector3d.h" => I don't use, so I don't include

class Vector3d;

class Point3d
{
	int m_x;
	int m_y;
	int m_z;
public:
	Point3d(int x, int y, int z);

	void moveByVector(const Vector3d &vector);

	void display();
};
#endif