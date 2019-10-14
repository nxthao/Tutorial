#include "pch.h"
#include <iostream>
#include "sum.h"
/*
This test for header file
*/

int sum(int x, int y)
{
	return x + 2 * y;
}

int main()
{
	int a = 2, b = 5 , s;
    std::cout << "Calculate the sum of 2 numbers\n";
    s = sum(a, b);
    std::cout << "Total when double b is " << s << "\n";
    s = Total::sum(a, b);
    std::cout << "Total is " << s << "\n";
    return 0;
}