#include "pch.h"
#include <iostream>
#include <cstdint>
/*
we can use the sizeof operator (which returns a value of type size_t) to ask for the size of size_t itself
*/
int main()
{
    std::int16_t i(5); // direct initialization
    std::cout << i;
    // To check int in my pC is 2 byte (16 bit) or 4 byte (32 bit)
    std::cout << sizeof(int);
    std::cout << sizeof(size_t);
    return 0;
}