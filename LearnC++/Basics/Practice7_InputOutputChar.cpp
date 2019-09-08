#include "pch.h"
#include <iostream>
/*
Basic input and output char
static_cast<int> to move character to ASCII
*/

char a;
int main()
{
	std::cout << "Input the character \n";
	std::cin >> a;
	std::cout << "character " << a << " has ASCII code " << static_cast<int>(a) << "\n";
	std::cin >> a; // I don't need to input the data
	std::cout << "Continue take a character " << a << " has ASCII code " << static_cast<int>(a) << "\n";
	int b(a);
	std::cout << "Assign the character "<< a << " to int " << b << "\n";
	return 0;
}