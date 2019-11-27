#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Fruit
{
protected:
    string m_name;
    string m_color;
public:
    Fruit(string name, string color)
        : m_name(name), m_color(color)
    {

    }
};

class Apple : public Fruit
{
public:
    Apple(string name = "apple", string color = "red")
        : Fruit(name, color)
    {

    }

    void display()
    {
        cout << "My " << m_name << " is " << m_color << endl;
    }
};

class Banana : public Fruit
{
public: 
    Banana(string name = "banana", string color = "yellow")
        : Fruit(name, color)
    {

    }
    
    void display()
    {
        cout << "My " << m_name << " is " << m_color << endl;
    }
};

class GrannySmith : public Apple
{
public:
    GrannySmith(string name = "granny smith", string color = "green")
        : Apple(name, color)
    {

    }
    void display()
    {
        cout << "My " << m_name << " is " << m_color << endl;
    }
};

int main()
{
    Apple a("apple","red");
    Banana b;
    GrannySmith c;

    a.display();
    b.display();
    c.display();
    return 0;
}

