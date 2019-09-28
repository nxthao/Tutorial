#include "pch.h"
#include <iostream>
#include <string>
#include <algorithm>

using namespace std;

int length;
string * name;

void SortName(string *tmp)
{
	sort(tmp, tmp + length)	;
}

string* Display(string *tmp)
{
	cout << "Display the whole list: \n";
	for (size_t i = 0; i < length; i++)
	{
		cout << "name " << i << ": " << *tmp << endl;
		tmp++;
	}
	return tmp;
}

void main()
{
	cout << "Please enter the number of name which I need to look for: \n";
	cin >> length;
	cin.ignore(32767, '\n');
	name = new string[length];
	if (name == nullptr)
	{
		cout << "Unable to allocate memory \n";
	}
	else
	{
		cout << "Allocate memory successfully \n";
	}

	for (int i = 0; i < length; i++)
	{
		cout << "Please enter name " << i << ": ";
		getline(cin, name[i]);
	}

	SortName(name);

	Display(name);

	// deallocate
	delete[] name;
}