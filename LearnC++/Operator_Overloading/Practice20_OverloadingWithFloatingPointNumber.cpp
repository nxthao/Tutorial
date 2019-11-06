#include "pch.h"
#include <iostream>
#include <cstdint>

using namespace std;

class FixedPoint2
{
	std::int_least16_t m_nonFraction;
	std::int_least16_t m_fraction;
public:
	FixedPoint2(int nonFraction, int fraction)
		: m_nonFraction(nonFraction), m_fraction(fraction)
	{
		if (nonFraction < 0 && fraction < 0)
		{
			m_nonFraction = nonFraction;
			m_fraction = -fraction;
		}
		else if(fraction < 0)
		{
			m_nonFraction = -nonFraction;
			m_fraction = -fraction;
		}
	}

	friend std::ostream& operator<<(std::ostream &out, FixedPoint2 point);
};

std::ostream& operator<<(std::ostream &out, FixedPoint2 point)
{
	out << point.m_nonFraction << "." << point.m_fraction;
	return out;
}


int main()
{
	FixedPoint2 a(23,57);
	cout << a << endl;

	FixedPoint2 b(-5,7);
	cout << b << endl;

	FixedPoint2 c(-8,-9);
	cout << c << endl;

	FixedPoint2 d(1,-4);
	cout << d << endl;
	return 0;
}