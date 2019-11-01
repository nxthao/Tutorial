#include "pch.h"
#include <iostream>

using namespace std;

class Fraction
{
	int m_numerator;
	int m_denominator;
public:
	Fraction(int numerator = 0, int denominator = 1)
		: m_numerator(numerator), m_denominator(denominator)
	{

	}

	Fraction(Fraction &f)
		: m_numerator(f.m_numerator), m_denominator(f.m_denominator)
	{
		cout << "Call copy constructor\n";
	}
	friend std::ostream& operator<< (std::ostream& out, Fraction &f);
};

std::ostream& operator<< (std::ostream& out, Fraction &f)
{
	out << f.m_numerator << " / " << f.m_denominator << endl;
	return out;
}

int main()
{
	Fraction f1(2, 3);
	cout << f1 << endl;
	Fraction f2(f1);
	cout << f2 << endl;
	Fraction f3 = 4;
	cout << f3 << endl;
	return 0;
}