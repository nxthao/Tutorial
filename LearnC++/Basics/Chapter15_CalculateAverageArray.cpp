#include "pch.h"
#include <iostream>

Using namespace std;
float average;
int bestScore;

float CalculateAverageScore(int tmp[5])
{
    float sum = 0;
    float av;
    for (int i = 0; i < 5; i++)
    {
        sum += tmp[i];
    }
    av = sum / 5;
    return av;

}

float BestScore(int tmp[5])
{
    int best = tmp[0];
    for (int i = 0; i < 5; i++)
    {
        if (best < tmp[i])
        {
            best = tmp[i];
        }
    }
    return best;
}

void main()
{
    int scoreStudent[5] = {7, 8, 10, 5, 9};
    average = CalculateAverageScore(scoreStudent);
	cout << "Average score = " << average <<  endl;
    bestScore = BestScore(scoreStudent);
    cout << "Best score = " << bestScore << endl;
}
