#include "pch.h"
#include <iostream>
/*
Quiz 6: chapter 6.x
*/

using namespace std;

enum CardRank
{
	RANK_2 = 0,
	RANK_3 = 1,
	RANK_4 = 2,
	RANK_5 = 3,
	RANK_6 = 4,
	RANK_7 = 5,
	RANK_8 = 6,
	RANK_9 = 7,
	RANK_10 = 8,
	RANK_JACK = 9,
	RANK_QUEEN = 10,
	RANK_KING = 11,
	RANK_ACE = 12,
	MAX_RANK = 13
};

enum CardSuit
{
	CLUBS = 0,
	DIAMONDS = 1,
	HEARTS = 2,
	SPADES = 3,
	MAX_SUIT = 4
};

typedef struct
{
    CardRank rank;
    CardSuit suit;
}Card_t;

void printCard(Card_t *tmp)
{
	//Card_t tmp = refCard;
    switch(tmp->rank)
    {
        case RANK_2:
        {
            cout << "2";
            break;
        }
        case RANK_3:
        {
            cout << "3";
            break;
        }
        case RANK_4:
        {
            cout << "4";
            break;
        }
        case RANK_5:
        {
            cout << "5";
            break;
        }
        case RANK_6:
        {
            cout << "6";
            break;
        }
        case RANK_7:
        {
            cout << "7";
            break;
        }
        case RANK_8:
        {
            cout << "8";
            break;
        }
        case RANK_9:
        {
            cout << "9";
            break;
        }
        case RANK_10:
        {
            cout << "10";
            break;
        }
        case RANK_JACK:
        {
            cout << "J";
            break;
        }
        case RANK_QUEEN:
        {
            cout << "Q";
            break;
        }
        case RANK_KING:
        {
            cout << "K";
            break;
        }
        case RANK_ACE:
        {
            cout << "A";
            break;
        }
    }

    switch (tmp->suit)
    {
        case CLUBS:
        {
            cout << "C";
            break;
        }
        case DIAMONDS:
        {
            cout << "D";
            break;
        }
        case HEARTS:
        {
            cout << "H";
            break;
        }
        case SPADES:
        {
            cout << "S";
            break;
        }
    }
    cout << endl;
}

void PrintDeck(Card_t *tmp, int length)
{
	cout << "Show the whole card of deck \n";
	for (int i = 0; i < length; i++)
	{
		printCard(tmp);
		tmp++;
	}
}

// Card_t* InputDeck()
// {
// 	Card_t *mytemp
// 	for (int i = 0; i < MAX_RANK; i++)
// 	{
// 		for (int j = 0; j < MAX_SUIT; j++)
// 		{
// 			myCard->rank = static_cast<CardRank>(i);
// 			myCard->suit = static_cast<CardSuit>(j);
// 			myCard++;
// 			cout << static_cast<CardRank>(i) << endl;
// 			cout << static_cast<CardSuit>(j) << endl;
// 		}
// 	}
// }

int main()
{
	const int length = 52;
	Card_t *myCard;
	// Allocate array to store card
	myCard = new Card_t[length];

	if (myCard == nullptr)
	{
		cout << "Unable to allocate memory \n";
	}
	else
	{
		cout << "Allocate memory successfully \n";
	}
	// Initial deck	
	for (int i = 0; i < MAX_RANK; i++)
	{
		for (int j = 0; j < MAX_SUIT; j++)
		{
			myCard[i].rank = static_cast<CardRank>(i);
			myCard[j].suit = static_cast<CardSuit>(j);
			//myCard++;
			cout << static_cast<CardRank>(i) << endl;
			cout << static_cast<CardSuit>(j) << endl;
		}
	}
	PrintDeck(myCard, length);
	return 0;
}