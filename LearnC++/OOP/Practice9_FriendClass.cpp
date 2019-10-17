#include "pch.h"
#include <iostream>

using namespace std;

class Number
{
	int m_int;
	double m_double;
public:
	Number(int intValue, double doubleValue)
		: m_int(intValue), m_double(doubleValue) 
	{

	}

	friend class Display;
};

class Display
{
	bool m_displayInteger;
public:
	Display(bool displayInteger)
		: m_displayInteger(displayInteger)
	{

	}

	void displayValue(Number &number)
	{
		if (m_displayInteger == true)
		{
			cout << "Integer value: " << number.m_int << endl;
		}
		else
		{
			cout << "Double value: " << number.m_double << endl;
		}	
	}
};

int main()
{
	Number number(7, 8.2);
	Display display(false);
	display.displayValue(number);
	return 0;
}