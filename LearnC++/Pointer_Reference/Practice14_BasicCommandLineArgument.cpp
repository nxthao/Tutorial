#include "pch.h"
#include <iostream>
#include <sstream>

using namespace std;
 
int main(int argc, char *argv[])
{
	if (argc <= 1)
	{
		if (argv[0])
			cout << "Usage: " << argv[0] << " <number>" << endl;
		else
			cout << "Usage: <program name> <number>" << endl;
 
		exit(1);
	}

	cout << "Total argument count: " << argc << endl;

	cout << "Program name: " << argv[0] << endl;
 
	std::stringstream convert(argv[1]);
 
	int myint;
	if (!(convert >> myint))
		myint = 0;
 
	cout << "Got integer: " << myint << endl;
 
	return 0;
}