#include "pch.h"
#include <iostream>
#include <random> // for std::mt19937
#include <ctime> // for std::time

int a, b;
char c;
bool result;

int GetRandomNumber()
{
	std::mt19937 mersenne { static_cast<std::mt19937::result_type>(std::time(nullptr))};
	std::uniform_int_distribution<> rand(1,80);
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
	int i = 0;
	while (i++ < 7)
	{
		if (tmp1 == tmp2)
		{
			return 1;
		}
		else if (tmp1 < tmp2)
		{
			std::cout << "You submit the value higher than the expected value. Submit again times: " << i << "\n";
			tmp2 = GuessNumber();
		}
		else
		{
			std::cout << "You submit the value lower than the expected value. Submit again times: " << i << "\n";
			tmp2 = GuessNumber();
		}
	}	
	return 0;
}

void main()
{
next:
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
	std::cout << "Do you play again? y/n \n";
	std::cin >> c;
	if (c == 'y')
	{
		std::cout << "welcome you again \n";
		goto next;
	}
	else if (c == 'n')
	{
		std::cout << "See you again \n";
	}
	else
	{
		std::cout << "You submit wrongly, so see you again \n";
	}
}