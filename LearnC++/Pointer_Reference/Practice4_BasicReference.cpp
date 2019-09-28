#include "pch.h"
#include <iostream>
/*
Test reference: initial, check operation
Note: advantage: don't cost memory for reference
ref can not reassign to another variable.
*/
using namespace std;

void main()
{
	int a = 7;
	int &ref = a;
	cout << "The value of a varibale: " << a << endl;
	cout << "The value of reference: " << ref << endl;
	cout << "The address of variable: " << &a << endl;
	cout << "The address of reference: " << &ref << endl;
	// Change the value of reference
	ref = 8;
	cout << "The value of a varibale: " << a << endl;
	cout << "The value of reference: " << ref << endl;
	// Cahnge the value of a variable
	a = 10;
	cout << "The value of a varibale: " << a << endl;
	cout << "The value of reference: " << ref << endl;
}