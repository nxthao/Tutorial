#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Person
{
	string m_name;
	int m_age;
public:
	Person(string name, int age)
		: m_name(name), m_age(age)
	{

	}

public:
	string getName()
	{
		return m_name;
	}

	int getAge()
	{
		return m_age;
	}
};

class Employee
{
	int m_wage;
public:
	Employee(int wage)
		: m_wage(wage)
	{

	}
public:
	int getWage()
	{
		return m_wage;
	}
};

class Teacher : public Person, public Employee
{
	string m_grade;
public:
	Teacher(string name, int age, int wage, string grade)
		: Person(name, age), Employee(wage), m_grade(grade)
	{

	}

	friend std::ostream& operator<<(std::ostream& out, Teacher teacher);
};

std::ostream& operator<<(std::ostream& out, Teacher teacher)
{
	out << "Name: " << teacher.getName() << endl;
	out << "Age: " << teacher.getAge() << endl;
	out << "Wage: " << teacher.getWage() << endl;
	out << "Grade: " << teacher.m_grade << endl;
	return out;
}

int main()
{
	Teacher TN("Thao Nguyen", 24, 50, "English");
	cout << TN << endl;
	return 0;
}