#include "pch.h"
#include <iostream>

int a;
int b;

int GetValueFromUser()
{
	int input;
	std::cout << "Please enter a value from the keyboad: \n";
	std::cin >> input;
	return input;
}

int Total(int tmp1, int tmp2)
{
	return tmp1 + tmp2;
}

int Multiple(int tmp1, int tmp2)
{
	return tmp1 * tmp2;
}

int main()
{
	std::cout << "Please input the value! \n";
    a = GetValueFromUser();
    b = GetValueFromUser();
    std::cout << "Total of " << a << " and " << b << '\n';
    std::cout << Total(a, b) << "\n";
    std::cout << "Multiple of " << a << " and " << b << "\n";
    std::cout << Multiple(a, b) << "\n";
}
