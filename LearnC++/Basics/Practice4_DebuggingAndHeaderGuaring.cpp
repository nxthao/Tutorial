#include "pch.h"
#include <iostream>

#define ENABLE_DEBUG

int a;
int b;

int GetInput()
{
#ifdef ENABLE_DEBUG
std::cerr << "Debug get input \n";
#endif
    int tmp;
    std::cout << "Please input the value \n";
    std::cin >> tmp;
    return tmp;
}

int Total(int tmp1, int tmp2)
{
#ifdef ENABLE_DEBUG
std::cerr << "Debug get total \n";
#endif
    return tmp1 + tmp2;
}

int main()
{
    a = GetInput();
    b = GetInput();
    std::cout << "The total of " << a << " and " << b << Total(a, b) << "\n";
    return 0;
}