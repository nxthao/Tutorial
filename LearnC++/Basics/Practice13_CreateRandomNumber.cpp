#include "pch.h"
#include <iostream>
#include <random> // for std::mt19937
#include <ctime> // for std::time
#define ENABLE_RAND
//#define ENABLE_DIE

#ifdef ENABLE_RAND
int getRandomNumber()
{
	std::mt19937 mersenne { static_cast<std::mt19937::result_type>(std::time(nullptr))};
	std::uniform_int_distribution<> rand(1,80);
	return rand(mersenne);
}
#endif

#ifdef ENABLE_DIE
int getRandomNumber()
{
    std::mt19937 mersenne { static_cast<std::mt19937::result_type>(std::time(nullptr)) };
    std::uniform_int_distribution<> die(1, 6);
    return die(mersenne);
}
#endif

int main()
{
	std::cout << getRandomNumber() << "\n";
}
