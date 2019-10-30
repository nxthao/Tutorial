#include "pch.h"
#include <iostream>

using namespace std;

class InitList
{
	int m_list[5] = {0, 2, 4, 6, 8};
public:

	// for non-const objects: can be used for assignment
	int& operator[](int index); // Why I need to return reference, check in chapter 9.8

	// for const objects: can only be used for access
	int operator[] (int index) const;
};

int& InitList::operator[](int index) 
{
	return m_list[index];
}

int InitList::operator[] (int index) const
{
	return m_list[index];
}

int main()
{
	InitList list;
	list[2] = 4;
	cout << list[2] << endl;

	const InitList cList;
	cout << cList[4] << endl;
	return 0;
}
