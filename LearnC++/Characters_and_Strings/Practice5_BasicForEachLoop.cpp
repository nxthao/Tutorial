#include "pch.h"
#include <iostream>
#include <string>
/*
Declare a fixed array with the following names: Hoa, Loi, Thao, Nguyen, Truc, Dao and Hieu. 
Ask the user to enter a name. Use a for each loop to see if the name the user entered is in the array
*/
using namespace std;

string name[7] = {"Hoa", "Loi", "Thao", "Nguyen", "Truc", "Dao", "Hieu"};
string expectedName;

void main()
{
next:
	cout << "Please enter a name: ";
	cin >> expectedName;
	for (auto &element : name)
	{
		if (element.compare(expectedName) == 0)
		{
			cout << "This name has in member list of my family \n";
			goto ask;
		}
	}
	cout << "This name does not have in member list of my family \n";

ask: 
	cout << "Do you want to continue? YES/NO: ";
	char a[20];
	cin >> a;
	if (strcmp(a, "YES") != 0)
	{
		goto end;
	}
	else
	{
		goto next;
	}

end:
	cout << "See you again";
}