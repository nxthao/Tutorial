#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class MyString
{
	string m_str;
public:
	explicit MyString(int x)
	{
		m_str.resize(x);
	}

	MyString(string str)
		: m_str(str)
	{
		cout << m_str;
	}

	friend std::ostream& operator<<(std::ostream& out, MyString str);
};

std::ostream& operator<<(std::ostream& out, MyString str)
{
	out << str.m_str << endl;
	return out;
}

void printString(MyString str)
{
	cout << str << endl;
}

int main()
{
	MyString str1('N');
	cout << str1;
	printString(str1);
	return 0;
}