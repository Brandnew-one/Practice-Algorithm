#include <algorithm>
#include <iostream>
#include <vector>

using namespace std;
int n;
int board[1500 * 1500 + 2];

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> n;
    for(int i = 0; i < n; i++) {
        for(int j = 0; j < n; j++) {
            cin >>board[j + n * i];
        }
    }

    sort(board, board + n * n, greater<int>());
    cout << board[n - 1];

    return 0;
}