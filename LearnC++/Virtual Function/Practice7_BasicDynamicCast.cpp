#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Base
{
protected:
    string m_name;
public:
    Base(string name)
        : m_name(name)
    {

    }

    virtual ~ Base()
    {
        cout << "destruct Base\n";
    }
};

class Derived : public Base
{
    int m_value;
public:
    Derived(string name, int value)
        : Base(name), m_value(value)
    {

    }

    string getName()
    {
        return m_name;
    }

    ~ Derived()
    {
        cout << "destruct Derived\n";
    }
};

Base *getOject(bool status)
{
    if (status)
    {
        return new Derived("Apple", 2);
    }
    else
    {
        return new Base("Banana");
    }
}

int main()
{
    Base *b = getOject(true);
    Derived *d = dynamic_cast<Derived*>(b);
    if (d)
    {
        cout << "Value of derived is: " << d->getName() << endl; 
    }
    return 0;
}