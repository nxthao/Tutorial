#include "pch.h"
#include <iostream>
#include <string>
/*
Check the string contain all digital or not
Check String has point or not, if it has, remove it
after that, replace it by %20
*/
using namespace std;

string domain;
bool returned;
int l;

int CheckLength(string tmp)
{
	return tmp.length();
}

bool CheckDigital(string tmp, int l)
{
	for (size_t i = 0; i < l; i++)
	{
		if (tmp.at(i) < '0' || tmp.at(i) > '9')
		{
			return 1;
		}
		else
		{
			return 0;
		}
	}
}

string ReplayPointAndSpacebyBlankWith20(string tmp, int l)
{
	int pos1 = 0;
	int pos2 = 0;
	string s_replace = "%20";
	// loop untill replace the whole point by Blank with 20
	while ((pos1 = tmp.find(".", pos1)) != string::npos)
	{
		tmp.replace(pos1, 1, s_replace);
		pos1++;
	}

	while ((pos2 = tmp.find(" ", pos2)) != string::npos)
	{
		tmp.replace(pos2, 1, s_replace);
		pos2++;
	}
	return tmp;
}

void Display(string tmp)
{
	cout << tmp;
}

int main()
{
    cout << "Please input the string \n";

input_again:
    getline(cin, domain);
    l = CheckLength(domain);
    returned = CheckDigital(domain, l);
    if (returned == 1)
    {
    	cout << "The domain is valid \n";
    }
    else
    {
    	cout << "The domain is invalid: All domain is digital. Please input other domain \n";
    	goto input_again;
    }
    domain = ReplayPointAndSpacebyBlankWith20(domain, l);
    Display(domain);
}
