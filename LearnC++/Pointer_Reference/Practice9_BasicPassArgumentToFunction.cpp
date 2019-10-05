#include "pch.h"
#include <iostream>
/*
Quiz 1-5: chapter 7.4a
*/
using namespace std;

struct Employee
{
	string name;
	int id;
};

void SumTo(int c, int d)
{
	int Sum = 0;
	if (c < d)
	{
		while (c <= d)
		{
			Sum += c++;
		}
	}
	else
	{
		while (d <= c)
		{
			Sum += d++;
		}
	}
	cout << "Sum: " << Sum << endl;
}

void PrintEmployee(struct Employee *tmpEmployee, int length)
{
	cout << "Print the whole list: \n";
	for(int i = 0; i < length; i++)
	{
		cout << "The name of employee " << i + 1 << ": " << tmpEmployee->name << endl;
		cout << "The id of employee " << i + 1 << ": " << tmpEmployee->id << endl;
		tmpEmployee++;
	}
}

void main()
{
	// Quiz 1
	cout << "Quiz 1 \n";
	int a = 1;
	int b;
	cout << "Please input a number: ";
	cin >> b;
	SumTo(a, b);

	// Quiz 2
	cout << "Quiz 2 \n";

	int size = 5;
	Employee *listEmployee;
	listEmployee = new Employee[size];
	if (listEmployee == nullptr)
	{
		cout << "Unable to allocate the memory \n";
		exit(0);
	}

	cout << "Please input the name and id of the employees \n";
	int i = 0;
	while (i < size)
	{
		cout << "Please input name of employee: " << i + 1 << endl;
		cin >> listEmployee[i].name;
		cout << "Please input id of employee: " << i + 1 << endl;
		cin >> listEmployee[i].id;
		i++;
	}

	PrintEmployee(listEmployee, size);
}