#include "pch.h"
#include <iostream>

using namespace std;

class Calculation
{
	int m_a;
public:
	Calculation(int a = 0)
		: m_a(a)
	{

	}

	void display()
	{
		cout << "Value: " << m_a << endl;
	}

	friend Calculation operator+(const Calculation& x, const Calculation& y);
	friend Calculation operator+(const Calculation& x, int y);
	friend Calculation operator+(int x, const Calculation &y);
};

Calculation operator+(const Calculation &x, const Calculation &y)
{
	//Calculation sum;
	//sum = x.m_a + y.m_a;
	//return sum;
	return Calculation(x.m_a + y.m_a);
}

Calculation operator+(const Calculation &x, int y)
{
	return Calculation(x.m_a + y);
}

Calculation operator+(int x, const Calculation &y)
{
	return Calculation(x + y.m_a);
}

int main()
{
	Calculation a1(5);
	Calculation a2(7);
	Calculation a3 = a1 + a2;
	Calculation a4 = a1 + 2;
	Calculation a5 = 3 + a2;
	Calculation a6(8);
	Calculation a7 = a3 + a4 + 20 +7;
	a3.display();
	a4.display();
	a5.display();
	a7.display();
	return 0;
}