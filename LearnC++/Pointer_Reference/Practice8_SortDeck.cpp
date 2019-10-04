#include "pch.h"
#include <iostream>
#include <random> // for std::mt19937
#include <ctime> // for std::time
/*
Quiz 6: chapter 6.x
*/
using namespace std;

const int length = 52;

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

void InputCard(Card_t *tmp)
{
    for (int i = 0; i < MAX_RANK; i++)
    {
        for (int j = 0; j < MAX_SUIT; j++)
        {
            tmp->rank = static_cast<CardRank>(i);
            tmp->suit = static_cast<CardSuit>(j);
            tmp++;
            // Or can use array replcae pointer as bellow
            // tmp[MAX_SUIT*i + j].rank = static_cast<CardRank>(i);
            // tmp[MAX_SUIT*i + j].suit = static_cast<CardSuit>(j);
            cout << static_cast<CardRank>(i) << endl;
            cout << static_cast<CardSuit>(j) << endl;
        }
    }
}

void SwapCard(Card_t &a, Card_t &b)
{
    Card_t tmp;
    tmp = a;
    a = b;
    b = tmp;
    cout << "rank" << b.rank << endl;
    cout << "suit" << b.suit << endl;
}

int GetRandomNumber()
{
    std::mt19937 mersenne { static_cast<std::mt19937::result_type>(std::time(nullptr))};
    std::uniform_int_distribution<> rand(1,52);
    return rand(mersenne);
}

void ShuffleDeck(Card_t *myCard)
{
    int random;
    for (int i = 0; i < length; i++)
    {
        random = GetRandomNumber();
        cout << "Index of random: " << random << endl;
        SwapCard(myCard[i], myCard[random]);
    }
}

int main()
{
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
    /*
    Note: Should not use this snippet to initial:
    1. It is not flexible
    2. Only use array to move to next element
    3. Unable to use pointer to move to next element, because it will change the initial address of the pointer
    for (int i = 0; i < MAX_RANK; i++)
    {
        for (int j = 0; j < MAX_SUIT; j++)
        {
            // myCard->rank = static_cast<CardRank>(i);
            // myCard->suit = static_cast<CardSuit>(j);
            // myCard++;
            // Or can use array replcae pointer as bellow
            myCard[MAX_SUIT*i + j].rank = static_cast<CardRank>(i);
            myCard[MAX_SUIT*i + j].suit = static_cast<CardSuit>(j);
            cout << static_cast<CardRank>(i) << endl;
            cout << static_cast<CardSuit>(j) << endl;
        }
    }
    */
    InputCard(myCard); // should use this function to initial

    PrintDeck(myCard, length);

    ShuffleDeck(myCard);

    PrintDeck(myCard, length);
    
    delete[] myCard;
    return 0;
}