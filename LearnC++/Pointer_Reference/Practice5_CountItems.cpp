#include "pch.h"
#include <iostream>
/*
Quiz time 1/ chapter 6.x
The player should start with 2 health potions, 5 torches, and 10 arrows. 
Write a function called countTotalItems() that returns how many items the player has in total
*/
using namespace std;

enum ItemTypes
{
	HEALTH_POSITION,
	TORCHE,
	ARROW,
	MAX_ITEM
};

int CountTotalItems(int *tmp)
{
	int total = 0;
	for (int i = 0; i < MAX_ITEM; i++)
	{
		total += *(tmp + i);
	}
	return total;
}

void main()
{
	int total;
	int items[MAX_ITEM] = {2, 5, 10};
	total = CountTotalItems(items);
	cout << "Total items: " << total << endl;
}
