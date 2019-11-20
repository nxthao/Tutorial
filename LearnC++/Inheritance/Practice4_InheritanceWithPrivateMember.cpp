#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Person
{
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

    int getGoal()
    {
        return m_goal;
    }

    int getAssist()
    {
        return m_assist;
    }
};

int main()
{
    Person person1("Thao Nguyen", 24);
    cout << "Name: " << person1.getName() << endl;
    cout << "Age: " << person1.getAge() << endl;
    cout << endl;    

    FootballPlayer player1(20, 50, "Thao Nguyen", 24);
    cout << "Name: " << player1.getName() << endl;
    cout << "Age: " << player1.getAge() << endl;
    cout << "Goal: " << player1.getGoal() << endl;
    cout << "Assist: " << player1.getAssist() << endl;

    return 0;
}