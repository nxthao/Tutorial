#include "pch.h"
#include <iostream>
#include <string>
/*
Basic string
Initial string, copy, inseart, ...
*/
using namespace std;
string firstName;
string lastName;
string fullName;
string message;

void main()
{
	cout << "The name string should be empty:" << firstName << endl;
	cout << "Please enter the first name \n";
	cin >> firstName;
	cout << "First name is: " << firstName << endl;
	// Clean the stdin
	cin.ignore(32767, '\n');
	cout << "Please enter the full name \n";	
	getline(cin, fullName);
	cout << "Length of full name: " << fullName.length() << endl;
	cout << "Full name is: " << fullName << endl;
	// Take last name from full name
	lastName.assign(fullName, 5, 7);
	cout << "Last name is: " << lastName << endl;
	cout << "Please enter the message \n";
	getline(cin, message);
	cout << message << endl;
	message.append(fullName);
	cout << message << endl;
}
