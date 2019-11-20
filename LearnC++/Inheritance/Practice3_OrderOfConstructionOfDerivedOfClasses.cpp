#include "pch.h"
#include <iostream>

using namespace std;

class A
{
public:
    A()
    {
        cout << "Constructor A \n";
    }
};

class B : public A
{
public: 
    B()
    {
        cout << "Constructor B \n";
    }
};

class C : public B
{
public:
    C()
    {
        cout << "Constructor C\n";
    }
};

class D : public C
{
public: 
    D()
    {
        cout << "Constructor D\n";
    }
};

int main()
{
    cout << "Create A\n";
    A a;
    cout << "Create B\n";
    B b;
    cout << "Create C\n";
    C c;
    cout << "Create D\n";
    D d;
    return 0;
}