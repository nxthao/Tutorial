#include "pch.h"
#include <iostream>
#include <vector>

using namespace std;

void DisplayVector2D(vector<vector<int>> tmp)
{
    cout << "Display vector 2D \n";
    for (int i = 0; i < 2; i++)
    {
    	for (int j = 0; j < 2; j++)
    	{
    		cout << tmp.at(i).at(j) << " ";
    	}
    	cout << endl;
    }
}

void main()
{
    vector<int> vector1;
    vector<int> vector2;
    vector1.push_back(10);
    vector1.push_back(20);
    cout << "Check length of vector1: " << vector1.size() << endl;
    cout << vector1.at(0) << endl;
    cout << vector1.at(1) << endl;
    vector2.push_back(100);
    vector2.push_back(200);
    cout << "Check size vector2: " << vector2.size() << endl;
    cout << vector2.at(0) << endl;
    cout << vector2.at(1) << endl;

    // Intial vector 2D
    vector<vector<int>> vector2D {{0, 0},
    							  {0, 0}};
    cout << "Add vector1 to vector2D \n";
    vector2D.at(0).at(0) = vector1.at(0);
    vector2D.at(0).at(1) = vector1.at(1);
    cout << "Add vector2 to vector2D \n";
    vector2D.at(1).at(0) = vector2.at(0);
    vector2D.at(1).at(1) = vector2.at(1);
    DisplayVector2D(vector2D);
}