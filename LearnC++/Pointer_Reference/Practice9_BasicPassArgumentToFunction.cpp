#include "pch.h"
#include <iostream>
/*
Quiz 1: chapter 7.4a
*/
using namespace std;

void SumTo(int c, int d)
{
	int Sum = 0;
	if (c < d)
	{
		while (c <= d)
		{
			Sum += c++;
		}
	}
	else
	{
		while (d <= c)
		{
			Sum += d++;
		}
	}
	cout << "Sum: " << Sum << endl;
}

void main()
{
	int a = 1;
	int b;
	cout << "Please input a number: ";
	cin >> b;
	SumTo(a, b);
}