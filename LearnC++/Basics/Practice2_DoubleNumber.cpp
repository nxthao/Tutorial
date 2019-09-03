// Practice2_DoubleNumber.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include <iostream>

int main()
{
	int x{};
    std::cout << "Please enter data!\n";
    std::cin >> x;
    std::cout << "Double the value of " << x << " is " << x * 2;
	return 0;
}

