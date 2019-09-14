#include "pch.h"
#include <iostream>
#include <random> // for std::mt19937
#include <ctime> // for std::time

int a, b;
bool result;

int GetRandomNumber()
{
	std::mt19937 mersenne { static_cast<std::mt19937::result_type>(std::time(nullptr))};
	std::uniform_int_distribution<> rand(1,10);
	return rand(mersenne);
}

int GuessNumber()
{
	static int tmp;
	std::cout << "Please guess any number! \n";
	std::cin >> tmp;
	return tmp;
}

bool CheckNumber(int tmp1, int tmp2)
{
	return a == b ? 1 : 0;
}

void main()
{
	a = GetRandomNumber();
	b = GuessNumber();
	result = CheckNumber(a, b);
	if (result == 1)
	{
		std::cout << "You guess the number successfully a = " << a << "\n";
	}
	else
	{
		std::cout << "You guess wrongly a = " << a << "\n";
	}
}