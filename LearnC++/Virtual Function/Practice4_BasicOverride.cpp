#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Animal
{
    string m_name;
public:
    Animal(string name)
        : m_name(name)
    {

    }

    string getName()
    {
        return m_name;
    }

    virtual string getSpeak()
    {
        return "???";
    }
};

class Cat : public Animal
{
public:
    Cat(string name)
        : Animal(name)
    {

    }

    virtual string getSpeak()  override
    {
        return "meow";
    }
};

class Dog : public Animal
{
public:
    Dog(string name)
        : Animal(name)
    {

    }

    virtual string getSpeak()  override
    {
        return "gol gol";
    }
};


int main()
{
    Cat cat { "Fred" };
    Dog dog("Garbo");
    cout << "Cat is named: " << cat.getName() << ", and it says " << cat.getSpeak() << endl;
    cout << "Cat is named: " << dog.getName() << ", and it says " << dog.getSpeak() << endl;

    Animal &c = cat;
    cout << "Cat is named: " << c.getName() << ", and it says " << c.getSpeak() << endl;
    Animal &d = dog;
    cout << "Cat is named: " << d.getName() << ", and it says " << d.getSpeak() << endl;
    return 0;
}