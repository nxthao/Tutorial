#include "pch.h"
#include <iostream>
#include <cassert>

using namespace std;

class Matrix
{
	int m_matrix[4][4];
public:
	Matrix()
	{
		for (int row = 0; row < 4; row++)
		{
			for (int col = 0; col < 4; col++)
			{
				m_matrix[row][col] = 0;
			}
		}
	}

	int& operator()(int row, int col);
	const int operator()(int row, int col) const;
	void operator()();
};

int& Matrix::operator()(int row, int col)
{
	assert(row >= 0 && row < 4, "Index of row is over the size");
	assert(col >= 0 && col < 4, "Index of col is over the size");
	return m_matrix[row][col];
}

const int Matrix::operator()(int row, int col) const
{
	assert(row >= 0 && row < 4, "Index of row is over the size");
	assert(col >= 0 && col < 4, "Index of col is over the size");
	return m_matrix[row][col];	
}

// Reset all of element in matrix
void Matrix::operator()()
{
	for (int row = 0; row < 4; row++)
	{
		for (int col = 0; col < 4; col++)
		{
			m_matrix[row][col] = 0;
		}
	}
}

int main()
{
	Matrix matrix1;
	matrix1(1, 2) = 8;
	cout << matrix1(1, 2) << endl;
	const Matrix matrix2;
	cout << matrix2(2, 3) << endl;
	matrix1();
	cout << matrix1(1, 2) << endl;
	return 0;
}