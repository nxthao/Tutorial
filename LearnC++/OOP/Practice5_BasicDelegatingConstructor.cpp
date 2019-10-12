#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Employee
{
	int m_id;
	string m_name;
public:
	Employee(int id = 0, string name = "Thao Nguyen")
		: m_id(id), m_name(name)
	{
	}

	Employee(string name)
		: Employee(0, name)
	{
	}

	void print()
	{
		cout << "id: " << m_id << endl;
		cout << "name: " << m_name << endl;
	}
};

int main()
{
	Employee employee;
	employee.print();

	Employee employee1(2, "Xuan Thao");
	employee1.print();
	return 0;
}