#include "pch.h"
#include <iostream>

using namespace std;

int A[] = {2, 5, 7, 1, 9, 4, 6, 3, 10, 0, 8};
int length;

void Swap(int &tmp1, int &tmp2);

bool Ascending(int tmp1, int tmp2);

void SortArray
(
	int *tmpArray,
	int tmpLength,
	bool (*comparation)(int, int)
)
{
	for (int i = 0; i < tmpLength; i++)
	{
		int expectedIndex = i;
		for (int j = i + 1; j < tmpLength; j++)
		{
			if (comparation(tmpArray[expectedIndex], tmpArray[j]))
			{
				expectedIndex = j;
			}
		}
		Swap(tmpArray[expectedIndex], tmpArray[i]);
	}
}

void Swap(int &tmp1, int &tmp2)
{
	int tmp;
	tmp = tmp1;
	tmp1 = tmp2;
	tmp2 = tmp;
}

bool EvenFirst(int tmp1, int tmp2)
{
	if ((tmp1 % 2 != 0) && (tmp2 % 2 == 0))
	{
		return 1;
	}
	if ((tmp1 % 2 == 0) && (tmp2 % 2 != 0))
	{
		return 0;
	}
	return Ascending(tmp1, tmp2);
}

bool OddFirst(int tmp1, int tmp2)
{
	if (tmp1 % 2 == 0 && tmp2 % 2 != 0)
	{
		return 1;
	}
	if (tmp1 % 2 != 0 && tmp1 == 0)
	{
		return 0;
	}
	return Ascending(tmp1, tmp2);
}

bool Ascending(int tmp1, int tmp2)
{
	return tmp1 > tmp2 ? 1 : 0;
}

void PrintArray(int *tmpArray, int tmpLength)
{
	for (int i = 0; i < tmpLength; i++)
	{
		cout << tmpArray[i] << " ";
	}
	cout << endl;
}

int main()
{
	length = sizeof(A) / sizeof(int);
	PrintArray(A, length);
	// Sort even first
	SortArray(A, length, EvenFirst);
	PrintArray(A, length);

	SortArray(A, length, OddFirst);
	PrintArray(A, length);
}