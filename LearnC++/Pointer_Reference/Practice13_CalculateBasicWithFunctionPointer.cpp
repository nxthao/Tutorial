#include "pch.h"
#include <iostream>
/*
Quiz 1: Chapter 7.8
Note: Good exercise
*/

using namespace std;

int x, y;
char op;

int GetValue()
{
	int tmp;
	cin >> tmp;
	return tmp;
}

char GetOperation()
{
	char tmp;
	do
	{
		cin >> tmp;
	} 
	while (tmp != '+' && tmp != '-' && tmp != '*' && tmp != '/');
	return tmp;
}

int Add(int tmp1, int tmp2)
{
	return tmp1 + tmp2;
}

int Subtract(int tmp1, int tmp2)
{
	return tmp1 - tmp2;
}

int Multiply(int tmp1, int tmp2)
{
	return tmp1 * tmp2;
}

int Divide(int tmp1, int tmp2)
{
	return tmp1 / tmp2;
}

typedef int (*ArithmeticFcn)(int, int);

ArithmeticFcn GetArithmeticFunction(char op)
{
	if (op == '+')
	{
		return Add;
	}
	else if (op == '-')
	{
		return Subtract;
	}
	else if (op == '*')
	{
		return Multiply;
	}
	else
	{
		return Divide;
	}
}

int main()
{
	cout << "Please input x: ";
	x = GetValue();
	cout << "Please input y: ";
	y = GetValue();
	cout << "Please input operator: ";
	op = GetOperation();
	ArithmeticFcn fcnPtr = GetArithmeticFunction(op);
	cout << "The value: " << fcnPtr(x, y);
}