#include "pch.h"
#include <iostream>
/*
need to const for variable of friend function 
*/
using namespace std;

class MinMax
{
	int m_min;
	int m_max;
public:
	MinMax(int min = 0, int max = 0)
		: m_min(min), m_max(max)
	{

	}

	void display()
	{
		cout << "Min: " << m_min << endl;
		cout << "Max: " << m_max << endl;
	}

	friend MinMax operator+(const MinMax &a, const MinMax &b);
	friend MinMax operator+(const MinMax &a, int b);
};

MinMax operator+(const MinMax &a, const MinMax &b)
{
	int min = a.m_min < b.m_min ? a.m_min : b.m_min;
	int max = a.m_max > b.m_max ? a.m_max : b.m_max;
	// MinMax minMax(min, max);
	// return minMax;
	return MinMax(min, max);
}

MinMax operator+(const MinMax &a, int b)
{
	int min = a.m_min < b ? a.m_min : b;
	int max = a.m_max > b ? a.m_max : b;
	return MinMax(min, max);
}

int main()
{
	MinMax couple1(3, 5);
	MinMax couple2(4, 10);
	couple1.display();
	couple2.display();
	MinMax finalCouple = couple1 + couple2 + 3 + 20 ;
	finalCouple.display();

}