#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Person
{
protected:
    string m_name;
    int m_age;
public:
    Person(string name =" ", int age = 0)
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
};

class FootballPlayer : public Person
{
    int m_goal;
    int m_assist;
public:
    FootballPlayer(int goal = 0, int assist = 0, string name = " ", int age = 0)
        : Person(name, age), m_goal(goal), m_assist(assist)
    {

    }

    friend std::ostream& operator<<(std::ostream& out, FootballPlayer player);
};

std::ostream& operator<<(std::ostream& out, FootballPlayer player)
{
    out << "Name: " << player.m_name << " Age: " << player.m_age << endl;
    out << "Goal: " << player.m_goal << " Assist: " << player.m_assist << endl;
    return out;
}

int main()
{
    FootballPlayer player1(20, 50, "Thao Nguyen", 24);
    cout << player1;
    return 0;
}