#include "pch.h"
#include <iostream>

using namespace std;

class Digit
{
	int m_number;
public:
	Digit(int number = 0)
		: m_number(number)
	{

	}

	Digit& operator++();

	Digit operator++(int);

	friend std::ostream& operator<<(std::ostream &out, const Digit &number);
};

Digit& Digit::operator++()
{
	if (m_number == 9)
	{
		m_number = 0;
	}
	else
	{
		++m_number;
	}
	return *this;
}

Digit Digit::operator++(int)
{
	Digit tmp;
	tmp = *this;
	++(*this);
	return tmp;
}

std::ostream& operator<<(std::ostream &out, const Digit &a)
{
	out << a.m_number;
	return out;
}

int main()
{
	Digit Digit;
	cout << Digit++;
	cout << ++Digit;
	cout << Digit++;
	return 0;
}