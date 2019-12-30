#include <iostream>

using namespace std;

int main()
{
    long n, q, k, i, j;
    cin >> n >> q;
    int **array = new int*[n];
    for (int a = 0; a < n; a++)
    {
        cin >> k;
        array[a] = new int[k];
        for (int b = 0; b < k; b++)
        {
            cin >> array[a][b];
        }
    }
    int m[q];
    for (int a = 0; a < q; a++)
    {
        cin >> i;
        cin >> j;
        m[a] = array[i][j];
    }
    for (int a = 0; a < q; a++)
    {
        cout << m[a] << endl;
    }
}