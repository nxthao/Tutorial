#include "pch.h"
#include <iostream>

int main()
{
	int a; // 2 byte signed	-32,768 to 32,767
	unsigned int b; // 2 byte unsigned	0 to 65,535
	a = 5;
	b = 10;
	std::cout << "a = " << a << "\n";
	std::cout << "b = " << b << "\n"; 
	// Check overflow
	a = 32770;
	b = 65538;
	std::cout << "overflow a = " << a << "\n";
	std::cout << "overflow b = " << b << "\n";
}
