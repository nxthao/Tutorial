#include "pch.h"
#include <iostream>
#include "Date.h"

using namespace std;

int main()
{
	Date date;
	cout << "Today: " << date.getYear() << "/" << date.getMonth() << "/" << date.getDay() << endl;
	return 0;
}