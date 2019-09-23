#include "pch.h"
#include <iostream>

using namespace std;

int a[5] = {2, 4, 6, 8, 10}; // Fixed array
char b[] = "Hello Thao Nguyen"; // C-style string (it is also an array)

void PassArray(int *tmp, int l)
{
	cout << "Display the array: \n";
	int i = 0;
	while (i < l)
	{
		cout << *tmp << " ";
		i++;
		tmp++;
	}
}

void main()
{
	int *p;
	int l1, l2;
	p = a;
	cout << "Dereferencing an array with array a: " << *a << endl; // It will access to the first element
	cout << "Dereferencing an array with pointer p: " << *p << endl; // It will access to the first element

	// Test size of array and pointer
	cout << "Size of array a: " << sizeof(a) << endl;
	cout << "Size of pointer p: " << sizeof(p) << endl;
	cout << "Size of C-style string b: " << sizeof(b) << endl; // Char is only a byte

	// Find length
	l1 = sizeof(a) / sizeof(int);
	cout << "Size of a array: " << l1 << endl;

	// Pass the value of array to function
	PassArray(a, l1); // It will pass addess of array
}