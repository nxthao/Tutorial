#include "pch.h"
#include <iostream>
#include "Date.h"

using namespace std;

#define DATE_H

int main()
{
	Date date;
	cout << "Today: " << date.getYear() << "/" << date.getMonth() << "/" << date.getDay() << endl;

	Date date1(2020, 10, 20);
	cout << "Future: " << date1.getYear() << "/" << date1.getMonth() << "/" << date1.getDay() << endl;
	return 0;
}