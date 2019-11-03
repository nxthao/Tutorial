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
		reduce();
	}

	// Copy constructor
	Fraction(const Fraction &f)
		: m_numerator(f.m_numerator), m_denominator(f.m_denominator)
	{
		cout << "Copy constructor \n";
		reduce();
	}

	void reduce()
	{
		int g = gcd(m_numerator, m_denominator);
		m_numerator = m_numerator / g;
		m_denominator = m_denominator / g;
	}

	int gcd(int a, int b)
	{
		return (b == 0) ? (a > 0 ? a : -a) : gcd(b, a % b);
	}

	Fraction& operator=(Fraction &f);

	friend std::ostream& operator<<(std::ostream &out, Fraction f);
};



std::ostream& operator<<(std::ostream &out, Fraction f)
{
	out << f.m_numerator << "/" << f.m_denominator << endl;
	return out;
}

Fraction& Fraction::operator=(Fraction &f)
{
	m_numerator = f.m_numerator;
	m_denominator = f.m_denominator;
	return *this;
}

int main()
{
	Fraction f1(2, 7);
	cout << f1 << endl;
	Fraction f2(f1);
	cout << f2 << endl;
	Fraction f3(2, 4);
	Fraction f4;
	f4 = f3;
	cout << f4 << endl;
	return 0;
}