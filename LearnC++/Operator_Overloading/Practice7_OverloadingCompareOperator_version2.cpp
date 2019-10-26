#include "pch.h"
#include <iostream>
#include <string>

using namespace std;

class Player
{
	string m_name;
	string m_club;	
	int m_goal;
	int m_assist;
public:
	Player(string name = "no name", string club = "no club", int goal = 0, int assist = 0)
		: m_name(name), m_club(club), m_goal(goal), m_assist(assist)
	{

	}

	void show()
	{
		cout << m_name << " plays for " << m_club << endl;
		cout << "He has " << m_goal << " goals and " << m_assist << " assists \n";
	}

	friend bool operator>(Player &player1, Player &player2);
	friend std::istream& operator>>(std::istream &in, Player &player);
};

bool operator>(Player &player1, Player & player2)
{
	return player1.m_goal > player2.m_goal ? 1 : 0;
}

std::istream& operator>>(std::istream &in, Player &player)
{
	cout << "Name: ";
	in >> player.m_name;
	cout << "Club: ";
	in >> player.m_club;
	cout << "Goal: ";
	in >> player.m_goal;
	cout << "Assist: ";
	in >> player.m_assist;
	return in;
}

int main()
{
	Player Assensio("Marco Assensio", "Real Madrid", 20, 10);
	Assensio.show();
	Player Felix("Joao Felix", "Atletico Madrid", 2, 1);
	Felix.show();
	if (Assensio > Felix)
	{
		cout << "Assensio plays better than Felix \n";
	}
	else
	{
		cout << "Assensio does not play as well as Felix \n";
	}

	cout << "Please input a player: \n";
	Player Pepe;
	cin >> Pepe;
	Pepe.show();

	cout << "Please input a player: \n";
	Player Rashford;
	cin >> Rashford;
	Rashford.show();

	if (Pepe > Rashford)
	{
		cout << "Pepe plays better than Rashford \n";
	}
	else
	{
		cout << "Pepe does not play as well as Rashford \n";
	}
	return 0;
}