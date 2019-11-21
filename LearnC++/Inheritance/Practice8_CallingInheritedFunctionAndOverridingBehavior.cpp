#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Things
{
protected:
	string m_name;
public:
	Things(string name)
		: m_name(name)
	{
		cout << "Initial Things class \n";
	}

	void display()
	{
		cout << m_name << "inherit from Things \n";
	}
};

class Table : protected Things
{
public:
	Table(string name)
		: Things(name)
	{
		cout << "Initial Table class \n";
	}

	void display()
	{
		cout << "On the " << m_name << " has a bookshelf\n";
	}
};

int main()
{
	Table table("table");
	table.display(); // It will call display of Table class
	return 0;
}
