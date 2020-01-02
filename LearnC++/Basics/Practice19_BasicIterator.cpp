#include "pch.h"
#include <iostream>
#include <array>

using namespace std;	

int main()
{
	std::array<int, 7> a{1, 2, 3, 4, 5, 6, 7};
	auto begin{a.begin()};
	auto end{a.end()};

	for (auto p{begin}; p != end; p++)
	{
		cout << *p << endl;
	}
}
