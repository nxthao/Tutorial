#include "pch.h"
#include <iostream>
#include <map>

using namespace std;

int main()
{
    map<int, int> mp;

    mp.insert({1, 10});
    mp.insert({2, 40});
    mp.insert({5, 10});
    mp.insert({7, 20});
    mp.insert({3, 30});

    cout << "element in mp\n";
    auto begin{mp.begin()};
    auto end{mp.end()};

    for (auto p{begin}; p !=end; ++p)
    {
        cout << "key:" << p->first << " value: " << p->second << endl;
    }
}