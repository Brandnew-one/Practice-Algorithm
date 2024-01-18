#include <iostream>
#include <vector>

using namespace std;
int n, m;
int board[1026][1026];
int d[1026][1026];

int prefixSub(int, int, int, int);

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> n >> m;
    for(int y = 0; y < n; y++) {
        for(int x = 0; x < n; x++) {
            cin >> board[y][x];
        }
    }

    for(int y = 0; y < n; y++) {
        for(int x = 0; x < n; x++) {
            if(y - 1 >= 0) { d[y][x] += d[y - 1][x]; }
            if(x - 1 >= 0) { d[y][x] += d[y][x - 1]; }
            if(y - 1 >= 0 && x - 1 >= 0) { d[y][x] -= d[y - 1][x - 1]; }
            d[y][x] += board[y][x];
        }
    }

    for(int i = 0; i < m; i++) {
        int y1, x1, y2, x2;
        cin >> y1 >> x1 >> y2 >> x2;
        cout << prefixSub(y1 - 1, x1 - 1, y2 - 1, x2 - 1) << '\n';
    }

    return 0;
}

int prefixSub(int y1, int x1, int y2, int x2) {
    int ans = d[y2][x2];
    if(x1 - 1 >= 0) { ans -= d[y2][x1 - 1]; }
    if(y1 - 1 >= 0) { ans -= d[y1 - 1][x2]; }
    if(x1 - 1 >= 0 && y1 - 1 >= 0) { ans += d[y1 - 1][x1 - 1]; }
    return ans;
}

