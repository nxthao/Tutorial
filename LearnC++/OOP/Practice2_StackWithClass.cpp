#include "pch.h"
#include <iostream>
#include <cassert>

using namespace std;

class Stack
{
	int m_value[10];
	int m_length = 0;
public:
	void reset()
	{
		m_length = 0;
	}

	bool push(int tmp)
	{
		if (m_length <= 10)
		{
			m_value[m_length++] = tmp;
			return 1;
		}
		else
		{
			return 0;
		}
	}

	int pop()
	{
		assert((m_length > 0) && "There are no values on the stack");
		return m_value[m_length--];
	}

	void print()
	{
		cout << "Show the value list: \n";
		cout << "(";
		for (int i = 0; i < m_length; i++)
		{
			cout << m_value[i] << " ";
		}
		cout << ")" << endl;
	}
};

int main()
{
	Stack stack;
	stack.reset();
	stack.print();

	stack.push(2);
	stack.push(4);
	stack.push(6);
	stack.push(8);
	stack.push(10);

	stack.print();
	stack.pop();
	stack.print();
	stack.pop();
	stack.pop();
	stack.pop();

	stack.print();

	return 0;
}