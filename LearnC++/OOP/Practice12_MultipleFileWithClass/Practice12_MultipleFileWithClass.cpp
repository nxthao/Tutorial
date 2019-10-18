#include "pch.h"
#include <iostream>
#include "Point3d.h"
#include "Vector3d.h"
/*
Header guard needs because many files can use this file, 
each times include this file, it will re call it
*/

using namespace std;

int main()
{
	Point3d point(1, 2, 3);
	Vector3d vector(4, 5, 6);
	point.display();
	point.moveByVector(vector);
	point.display();	
}