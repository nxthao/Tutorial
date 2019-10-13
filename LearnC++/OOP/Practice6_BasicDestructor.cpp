#include "pch.h"
#include <iostream>
#include <string>
/*
Note: 
- Global variables:(ex: student1) are constructed before main() and destroyed after main().
- pointer, struct: deleted before the end of the function
*/
using namespace std;

class Student
{
	int m_id;
	string m_name;
public:
	Student(int id, string name)
	{
		cout << "Constructing student \n";
		m_id = id;
		m_name = name;
	}

	int getID()
	{
		return m_id;
	}

	string getName()
	{
		return m_name;
	}

	~Student()
	{
		cout << "Destructing student: " << m_id << endl;
	}
};

int main()
{
	// Normal variable
	Student student1(2, "Thao Nguyen");
	cout << "Student ID: " << student1.getID() << endl;
	cout << "Student name: " << student1.getName() << endl;

	// Pointer
	Student *student2 = new Student(7, "Xuan Thao");
	cout << "Student ID: " << student2->getID() << endl;
	cout << "Student name: " << student2->getName() << endl;
	delete student2;
	
	return 0;
}