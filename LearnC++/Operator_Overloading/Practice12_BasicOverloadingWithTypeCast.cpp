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

void printInt(int temp)
{
	cout << "Value: " << temp << endl;
}

int main()
{
	Cents cents(7);
	printInt(cents);
	return 0;
}
