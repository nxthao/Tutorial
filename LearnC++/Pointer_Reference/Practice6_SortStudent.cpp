#include "pch.h"
#include <iostream>
#include <string>
//#include <algorithm>
/*
Quiz 2: chapter 6.x
*/
using namespace std;

typedef struct Student
{
	string firstName;
	int grade;
};

int length;

void InputStudent(Student *tmp)
{
	for (int i = 0; i < length; i++)
	{
		cout << "Please input the student " << i + 1 << endl;
		cout << "first name: ";
		cin >> tmp->firstName;
		cout << "grade: ";
		cin >> tmp->grade;
		tmp++;		
	}
}

void SortName(Student *student)
{
	for (int i = 0; i < length; i++)
	{
		for (int j = i + 1; j <= length; j++)
		{
			// (student + i)->grade: it is also ok
			if (student[i]grade < student[j].grade)
			{
				Student tmp;
				tmp.firstName = student[i].firstName;
				tmp.grade = student[i].grade;
				student[i].firstName = student[j].firstName;
				student[i].grade = student[j].grade;
				student[j].firstName = tmp.firstName;
				student[j].grade = tmp.grade;
			}
		}
	}
}

void Display(Student *tmp)
{
	cout << "Display the list \n";
	for (int i = 0; i < length; i++)
	{
		cout << tmp->firstName << " has a grade: " << tmp->grade << endl;
		tmp++;
	}
}

void main()
{
	cout << "Please input the number of students \n";
	cin >> length;
	Student *student;
	student = new Student[length];

	if (student == nullptr)
	{
		cout << "Unable to allocate the memory \n";
		exit(0);
	}
	else
	{
		cout << "Array is allocated the memory successfully \n";
	}

	InputStudent(student);

	SortName(student);

	Display(student);
}