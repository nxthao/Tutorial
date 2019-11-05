#include "pch.h"
#include <iostream>

using namespace std;

class Average
{
	int32_t m_total;
	int8_t m_number = 0;
public:
	Average(int32_t avg = 0)
		: m_total(avg)
	{
		++m_number;
	}

	Average operator+=(int num);
	friend std::ostream& operator<<(std::ostream& out, Average &avg);
};

Average Average::operator+=(int num)
{
	m_total += num;
	++m_number;
	return *this;
}

std::ostream& operator<<(std::ostream& out, Average &avg)
{
	out << "Average: " << avg.m_total / avg.m_number << endl;
	return out;
}

int main()
{
	Average avg(4);
	avg += 8;
	cout << avg << endl;
	return 0;
}