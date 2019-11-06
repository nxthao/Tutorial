#include "pch.h"
#include <iostream>
#include <cassert>

using namespace std;

class IntArray
{
	int *m_array;
	int m_length;
public:
	IntArray(int length)
		: m_length(length)
	{
		assert(length > 0 && "Length of array should be than more 0 \n");
		m_array = new int[m_length] { 0 };
		if (m_array == nullptr)
		{
			cout << "Unable to allocate memory \n";
		}
		else
		{
			cout << "Memory for pointer is allocated successfully \n";
		}
	}

	int& operator[](int index);
	friend std::ostream& operator<<(std::ostream& out, IntArray array);
};

int& IntArray::operator[](int index)
{
	return m_array[index];
}

IntArray fillArray()
{
	IntArray tmp(5);
	for (int i = 0; i < 5; i++)
	{
		tmp[i] = i;
	}
	return tmp;
}

std::ostream& operator<<(std::ostream& out, IntArray array)
{
	for (int i = 0; i < array.m_length; i++)
	{
		out << array.m_array[i] << " " ;
	}
	out << endl;
	return out;
}

int main()
{
	IntArray array1(5);
	cout << array1 << endl;
	IntArray array2 = fillArray();
	cout << array2 << endl;
	return 0;
}