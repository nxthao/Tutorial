#include "pch.h"
#include <iostream>
/*
When passing function to another function, if I want to pass the changed function to main function. Should use function pointer
below: passing Ascending, Descending to SortArray function, should use function pointer
Note: this exercise is Good sort
*/

using namespace std;

int A[] = {2, 5, 7, 1, 9, 4, 6, 3, 10, 0, 8};
int length;

void SwapArray(int &tmp1, int &tmp2);

// I only change how to compare from comparationPtr, I will have another sort
void SortArray
(
	int *tmpArray,
 	int tmpLength,
 	bool (*comparationPtr)(int, int)
)
{
	for (int i = 0; i < tmpLength; i++)
	{
		int expectedIndex = i; // It depend on how to sort
		for (int j = i + 1; j < tmpLength; j++)
		{
			/*
			I don't take the i index to compare, I will take expected index. It is the same,difference: 
			instead of compare -> swap -> compare -> swap -> at the end of the array (need many swaps)
			It will compare -> compare -> to at the end of the array, then it will only swap once 
			*/
			if (comparationPtr(tmpArray[expectedIndex], tmpArray[j]))
			{
				expectedIndex = j;
			}
		}
		SwapArray(tmpArray[expectedIndex], tmpArray[i]);
	}
}

void SwapArray(int &tmp1, int &tmp2)
{
	int tmp;
	tmp = tmp1;
	tmp1 = tmp2;
	tmp2 = tmp;
}

void PrintArray(int *tmpArray, int tmpLength)
{
	cout << "Show the whole element of the array \n";
	for (int i = 0; i < tmpLength; i++)
	{
		cout << tmpArray[i] << " ";
	}
	cout << endl;
}

bool Ascending(int tmp1, int tmp2)
{
	return tmp1 > tmp2 ? 1 : 0;
}

bool Descending(int tmp1, int tmp2)
{
	return tmp1 < tmp2 ? 1: 0;
}

int main()
{
	length = sizeof(A) / sizeof(int);
	PrintArray(A, length);
	SortArray(A, length, Ascending);
	PrintArray(A, length);

	SortArray(A, length, Descending);
	PrintArray(A, length);
};