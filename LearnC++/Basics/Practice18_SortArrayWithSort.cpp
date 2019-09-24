#include "pch.h"
#include <iostream>
#include <algorithm>
/*
Sort an array using std::sort() in C++ STL
*/
using namespace std;

void Display(int *tmp, int l)
{
	cout << "Display an array: \n";
	for (size_t i = 0; i < l; i++)
	{
		cout << *tmp << " ";
		tmp++;
	}
	cout << endl;
}

void main()
{
	int a[] = {2, 5, 1, 7, 0, 2, 8, 4, 10, 3};
	int l;
	l = sizeof(a) / sizeof(a[0]);
	cout << "Length of array: " << l << endl;
	// Increasing sort
	sort(a, a + l);
	Display(a, l);

	// Decreasing sort
	sort(a, a + l, greater<int>());
	Display(a, l);
}