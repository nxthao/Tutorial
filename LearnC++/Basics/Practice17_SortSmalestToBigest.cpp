#include "pch.h"
#include <iostream>

using namespace std;

int a[] = {5, 4, 7, 9, 2, 8, 10, 22, 1, 20};
int l, tmp;

void DisplayArray(int* tmp, int tmp1)
{
	cout << "Display a: \n";
	for (int i = 0; i < l; i++)
	{
		cout << *tmp++ << " ";
	}
	cout << endl;
}

int main()
{
	l = sizeof(a) / sizeof(a[0]);
	cout << "Length of a: " << l << endl;
	DisplayArray(a, l);
	cout << "Sort a from smallest to bigest \n";
	for (int i = 0; i < l; i++)
	{
		for (int j = i + 1; j < l;j ++)
		{
			if (a[i] > a[j])
			{
				tmp = a[i];
				a[i] = a[j];
				a[j] = tmp;
			}
		}
	}
	DisplayArray(a, l);
}
