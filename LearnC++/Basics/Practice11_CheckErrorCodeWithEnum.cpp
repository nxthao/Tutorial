#include "pch.h"
#include <iostream>

enum class ErrorCode
{
	SUCCESS = 0,
	ERROR = -1
};

ErrorCode CheckNumber(int tmp)
{
	if (tmp > 0)
	{
		return ErrorCode::SUCCESS;
	}
	else
	{
		return ErrorCode::ERROR;
	}
}

void SomeEvent(ErrorCode tmp)
{
	switch(tmp)
	{
		case ErrorCode::SUCCESS:
		{
			std::cout << "Input the value successfully \n";
			break;
		}
		case ErrorCode::ERROR:
		{
			std::cout << "Input the value is negative\n";
			std::cout << "Error code is " << static_cast<int>(tmp) << "\n";
			break;
		}
	}

}

void main()
{
	int x;
	ErrorCode c;
    std::cout << "Please enter a positive number \n";
    std::cin >> x;
    c = CheckNumber(x);
    SomeEvent(c);
}
