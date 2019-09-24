#include "pch.h"
#include <iostream>
/*
Basic about allocating memory for pointer

Note: When finishing a program, I need to free memory for operate system, if I don't free it, at the end. only pointer is 
destroyed, memory is not still free, so opeate system still understand that there is a program using this address
*/
using namespace std;

int main()
{
	int a = 7;
	int *ptr;
	// Alocate memory and assign value
	cout << "Allocate memory for pointer \n";
	ptr = new int;
	if (ptr == nullptr)
	{
		cout << "ptr is not allocated the memory \n";
	}
	else
	{
		cout << "Memory of pointer is allocated by heap. It has the address: " << ptr << endl;
		cout << "Memory of a variable is allocated by stack. It has the address: " << &a << endl;
		cout << "Address of pointer: " << &ptr << endl;
	}
	cout << "Assign value for pointer when pointer is allocated memory \n";
	*ptr = 8;
	cout << "Dereference of pointer: " << *ptr << endl;

	// Leak memory
	ptr = &a; // this is also leak memory
	cout << "Memory of pointer is allocated by heap. It has the address: " << ptr << endl;
	cout << "Memory of a variable is allocated by stack. It has the address: " << &a << endl;
	cout << "Address of pointer: " << &ptr << endl;
	cout << "Dereference of pointer: " << *ptr << endl;

	// Delete memory of pointer
	cout << "Delete memory of pointer \n";
	delete ptr;
	cout << "This will be errored \n";
	cout << "Dereference of pointer: " << *ptr << endl;
}