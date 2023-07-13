#include <iostream>
#include <queue>
#include <utility>

using namespace std;

int N, M;

int board[1002][1002];
int vis[1002][1002];
int dy[4] = {-1, 1, 0, 0};
int dx[4] = {0, 0, -1, 1};

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    queue<pair<int, int>> q;

    cin >> M >> N;
    for(int y = 0; y < N; y++) {
        for(int x = 0; x < M; x++) {
            cin >> board[y][x];
            if(board[y][x] == 1) {
                q.push({y, x});
                vis[y][x] = 1;
            }
        }
    }

    while(!q.empty()) {
        pair<int, int> cur = q.front();
        q.pop();

        for(int dir = 0; dir < 4; dir++) {
            int ny = cur.first + dy[dir];
            int nx = cur.second + dx[dir];

            if(ny < 0 || ny >= N || nx < 0 || nx >= M) continue;
            if(vis[ny][nx] >= 1) continue;
            if(board[ny][nx] == -1) continue;

            q.push({ny, nx});
            vis[ny][nx] = vis[cur.first][cur.second] + 1;
        }
    }

    int answer = -1;
    bool flag = 0;
    for(int y = 0; y < N; y++) {
        for(int x = 0; x < M; x++) {
            if(board[y][x] == -1) continue;
            if(vis[y][x] > answer) answer = vis[y][x];
            if(vis[y][x] == 0) flag = 1;
        }
    }

    cout << (flag ? -1 : answer - 1);
    return 0;
}