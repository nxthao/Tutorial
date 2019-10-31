#include "pch.h"
#include <iostream>

using namespace std;

class Cents
{
	int m_c;
public:
	Cents(int c = 0)
		: m_c(c)
	{

	}

	operator int() const 
	{
		return m_c;
	}
};

class Dollars
{
	int m_d;
public:
	Dollars(int d)
		: m_d(d)
	{

	}

	operator Cents() const
	{
		return (Cents(m_d * 100));
	}
};

void printCents(Cents temp)
{
	cout << "It is the same: " << temp << " Cents" << endl;
}

int main()
{
	Dollars dollars(7);
	printCents(dollars);
	return 0;
}