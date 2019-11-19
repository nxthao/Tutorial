#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Person
{
public:
    string m_name;
    int m_age;

    Person(string name = " ", int age = 0)
        : m_name(name), m_age(age)
    {

    }

    string getName()
    {
        return m_name;
    }

    int getAge()
    {
        return m_age;
    }

    friend std::ostream& operator<<(std::ostream& out, Person person);
};

class FootballPlayer : public Person
{
public: 
    int m_goal;
    int m_assist;

    FootballPlayer(int goal, int assist)
        : m_goal(goal), m_assist(assist)
    {

    }

    void display()
    {
        cout << "Name: " << m_name << " Age: " << m_age << endl;
        cout << "Goal: " << m_goal << " Assist: " << m_assist << endl;
    }
};

std::ostream& operator<<(std::ostream& out, Person person)
{
    out << "name: " << person.m_name << " Age: " << person.m_age << endl;
    return out;
}

int main()
{
    Person people1("Thao Nguyen", 24);
    cout << people1;

    FootballPlayer player1(20, 50);
    player1.m_name = "Thao Nguyen";
    player1.m_age = 24;
    player1.display();
    return 0;
}
