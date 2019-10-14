/*
default variable must to place at .h file
*/

#ifndef DATE_H
#define DATE_H

class Date
{
	int m_year;
	int m_month;
	int m_day;
public:

	Date(int year = 2019, int month = 10, int day = 14);

	int getYear();

	int getMonth();

	int getDay();
};

#endif