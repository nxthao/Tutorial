#include "pch.h"
#include <iostream>

enum Fruit
{
	BANANA = 0,
	APPLE = 1,
	WATERMELON = 2,
	ORANGE = 3
};

void CheckName(Fruit tmp)
{
	int a = tmp;
	std::cout << "The index of object is " << a << "\n";
	switch(tmp)
	{
		case BANANA:
		{
			std::cout << "This is banana \n";
			break;
		}
		case APPLE:
		{
			std::cout << "This is apple \n";
			break;
		}
		case WATERMELON:
		{
			std::cout << "This is watemelon \n";
			break;
		}
		case ORANGE:
		{
			std::cout << "This is orange \n";
			break;
		}
	}
}

int main()
{
	Fruit fruit = WATERMELON;
	std::cout << "Index of fruit is " << fruit << "\n";
	CheckName(fruit);
}
