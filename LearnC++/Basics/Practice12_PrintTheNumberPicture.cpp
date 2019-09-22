#include "pch.h"
#include <iostream>
/*
Note 5*: pch need to defined before iostream
Print as the bellow:
1
1 2
1 2 3
1 2 3 4
1 2 3 4 5
*/

void main()
{
	std::cout << "Print the picture 1 \n";
	int i = 1;
	while (i <= 5)
	{
		int j = 1;
		while (j <= i)
		{
			std::cout << j++ << " ";
		}
		std::cout << "\n";
		i++;
	}

    std::cout << "Print the picture 2\n";
    int m = 5;
    while (m >= 1)
    {
        int n = m;
        while (n >= 1)
        {
            std::cout << n-- << " ";
        }
        std::cout << "\n";
        m--;
    }

    std::cout << "Print the picture 3\n";
    int a = 1;
    while (a <= 5)
    {
        int b = 5;
        while (b >= 1)
        {
            if (b <= a)
            {
                std::cout << b << " ";
            }
            else
            {
                std::cout << "  ";
            }
            b--;
        }
        std::cout << "\n";
        a++;
    }
}

