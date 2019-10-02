#include "pch.h"
#include <iostream>
/*
Quiz 4: chapter 6.x
*/
using namespace std;

char message[] = "Hello the world developer from Thao Nguyen";

void Display(char *p)
{
	cout << "Show the messeage: \n";
	while (*p != '\0')
	{
		cout << *p;
		p++;
	}
	cout << endl;
}

void main()
{
	Display(message);
}