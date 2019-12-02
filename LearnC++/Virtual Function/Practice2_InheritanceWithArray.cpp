#include "pch.h"
#include <iostream>
#include <string>
// #include <string_view>

using namespace std;

class Animal
{
    string m_name;
    string m_speak;
public:
    Animal(string name, string speak)
        : m_name(name), m_speak(speak)
    {

    }

    string getName()
    {
        return m_name;
    }

    string getSpeak()
    {
        return m_speak;
    }
};

class Cat : public Animal
{
public:
    Cat(string name)
        : Animal(name, "meow")
    {

    }
};


int main()
{
	Cat cat[] {{ "Fred" }, {"Misty"}};
    for(Cat&element : cat)
    {
        cout << "Cat is named: " << element.getName() << ", and it says " << element.getSpeak() << endl;
    }
    
    return 0;
}