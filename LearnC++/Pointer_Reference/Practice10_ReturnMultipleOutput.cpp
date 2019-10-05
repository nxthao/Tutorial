#include "pch.h"
#include <iostream>
/*
Quiz 3/4: chapter 7.4a
*/
using namespace std;

int A[] = {2, 8, 4, 7, 3, 10, 5, 2};
int length, maxOut, maxIndex, minOut, minIndex;

void FindMaxMin
(
	int *array,			// IN
	int lengthArray, 	// IN
	int &max,			// OUT
	int &indexMax,		// OUT
	int &min,	 		// OUT
	int &indexMin		// OUT
)
{
	// max = array[0]; // Use array
	// min = array[0];
	max = *array;
	min = *array;
	for (int i = 0; i < length; i++)
	{
		if (max < *array)
		{
			max = *array;
			indexMax = i;
		}

		if (min > *array)
		{
			min = *array;
			indexMin = i;
		}
		array++;
	}
}

int main()
{
	// Find length of array
	length = sizeof(A) / sizeof(int);
	FindMaxMin(A, length, maxOut, maxIndex, minOut, minIndex);
	cout << "Max of array: " << maxOut << endl;
	cout << "Index of max value: " << maxIndex << endl;
	cout << "Min of array: " << minOut << endl;
	cout << "Index of min value: " << minIndex << endl; 
}

