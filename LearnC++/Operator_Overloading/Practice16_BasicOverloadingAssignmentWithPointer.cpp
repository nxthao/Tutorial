#include "pch.h"
#include <iostream>

using namespace std;

class MyString
{
	char *m_data;
	int m_length;
public:
	MyString(const char *data = "", int length = 0)
	{
		if (length == 0)
		{
			m_data = NULL;
		}
		else
		{
			m_length = length;
			m_data = new char[m_length];
		}
		for (int i = 0; i < m_length; i++)
		{
			m_data[i] = data[i];
		}
	}

	MyString operator=(MyString &str);
	friend std::ostream& operator<<(std::ostream& out, MyString& str);
};

MyString MyString::operator=(MyString &str)
{
	if (&str == this)
	{
		return *this;
	}

	m_length = str.m_length;
	m_data = new char[m_length];

	for (int i = 0; i < m_length; i++)
	{
		m_data[i] = str.m_data[i];
	}

	return *this;
}

std::ostream& operator<<(std::ostream& out, MyString& str)
{
	out << str.m_data;
	return out;
}

int main()
{
	MyString str1("Thao", 5);
	cout << str1 << endl;
	MyString str2;
	str2 = str1;
	cout << str2 << endl;
	return 0;
}