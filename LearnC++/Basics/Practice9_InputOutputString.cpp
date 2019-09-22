// Practice9_InputOutputString.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include "pch.h"
#include <iostream>
#include <string>

#define ENABLE_IGNORE

/*
std::cin it will end when seeing the white space, If I don't like to end, I can use
std::getline(std::cin, name);
it will be mixing std::cin and std::getline(), if I don't ignore the white space from std:cin
I will use: std::cin.ignore(32767, '\n');
Appending strings: use +
*/


int main()
{
	std::string name;
	std::string fullName;
    std::cout << "Please Input your name \n";
    std::cin >> name;
    std::cout << "The name is " << name << "\n";

    std::cout << "Please input full name \n";
    // it will be mixing std::cin and std::getline(), if I don't ignore the white space from std:cin
#ifdef ENABLE_IGNORE
std::cin.ignore(32767, '\n');
#endif

    std::getline(std::cin, fullName);
    std::cout << "Full name is " << fullName << "\n";
    std::cout << "The length full name is " << fullName.length() << "\n";
    return 0;
}
