#include "pch.h"
#include <iostream>
#include <string>
/*
C type string. should Use std::string instead of C-style string
*/
#define MAX 20
using namespace std;

char firstName [MAX];
char lastName [MAX];
char fullName [MAX];
char programer[] = {"Thao Nguyen"};

void main()
{
    cout << "Please enter first name \n";
    cin >> firstName;
    cin.ignore(32767, '\n');
    cout << "Please enter last name \n";
    cin >> lastName;
    cin.ignore(32767, '\n');
    cout << "Please enter full name \n";
    cin.getline(fullName, 20);
    cout << "Full name: " << fullName << endl;
    if (strcmp(fullName, programer) != 0)
    {
    	cout << "You don't have permission to use this laptop \n";
    }
    else
    {
    	cout << "Welcome back! \n";
    }
}