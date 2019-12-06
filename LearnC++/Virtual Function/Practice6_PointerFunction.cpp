#include "pch.h"
#include <iostream>

using namespace std;

int add(int x, int y)
{
    return x + y;
}

int subtract(int x, int y)
{
    return x - y;
}

int multiply(int x, int y)
{
    return x * y;
}

int main()
{
	int x, y;
    cout << "Input x: ";
    cin >> x;
    cout << "Input y: ";
    cin >> y;

    int op;

    do
    {
        cout << "Input an operation (add = 0; subtract = 1; multiply = 2): ";
        cin >> op;
	} while (op < 0 || op > 2);

    // int result;

    int (*FcnResult)(int, int) = nullptr;

    switch(op)
    {   
        case 0: FcnResult = add; break;
        case 1: FcnResult = subtract; break;
        case 2: FcnResult = multiply; break;
    }

    cout << "Result is " << FcnResult(x, y) << endl;
    return 0;
}