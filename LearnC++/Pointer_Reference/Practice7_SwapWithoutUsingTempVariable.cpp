#include "pch.h"
#include <iostream>
/*
Swap 2 variable without using temporary variable
*/
using namespace std;

int a = 10;
int b = 8;

// Use sum and subtraction
void ArithmeticOperator(int a, int b)
{
    a = a + b;
    b = a - b;
    a = a - b;
    cout << "After swaping an and b \n";
    cout << "a: " << a << endl;
    cout << "b: " << b << endl;

}

void BitwiseXOR(int a, int b)
{
	// a = 10; 1010
	// b = 8; 1000
    a = a ^ b; // a = 0010 
    b = a ^ b; // b = 1010
    a = a ^ b; // a = 1000
    cout << "After swaping with XOR bit: \n";
    cout << "a: " << a << endl;
    cout << "b: " << b << endl;
}

void main()
{
    cout << "Arithmetic Operators \n";
    cout << "a: " << a << endl;
    cout << "b: " << b << endl;
    ArithmeticOperator(a, b);

    cout << "Using Bitwise XOR \n";
    cout << "a: " << a << endl;
    cout << "b: " << b << endl;
    BitwiseXOR(a, b);
}