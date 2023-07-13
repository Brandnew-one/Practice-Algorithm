#include <iostream>
#include <utility>
#include <vector>
#include <queue>

int R, C;
char board[1002][1002];
int vis[1002][1002]; // fire
int exits[1002][1002]; // jihoon

int dy[4] = {-1, 1, 0, 0};
int dx[4] = {0, 0, -1, 1};

using namespace std;

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> R >> C;
    pair<int, int> start;
    vector<pair<int, int>> fires;
    for(int y = 0; y < R; y++) {
        string s;
        cin >> s;
        for(int x = 0; x < C; x++) {
            board[y][x] = s[x];
            if(s[x] == 'J') {
                start.first = y;
                start.second = x;
            } else if(s[x] == 'F') {
                fires.push_back({y, x});
            }
        }
    }

    // Fire
    queue<pair<int, int>> q;
    for(int i = 0; i < fires.size(); i++) {
        q.push(fires[i]);
        vis[fires[i].first][fires[i].second] = 1;
    }

    while(!q.empty()) {
        pair<int, int> cur = q.front();
        q.pop();

        for(int dir = 0; dir < 4; dir++) {
            int ny = cur.first + dy[dir];
            int nx = cur.second + dx[dir];

            if(ny < 0 || ny >= R || nx < 0 || nx >= C) continue;
            if(board[ny][nx] == 'J' || board[ny][nx] == '#')continue;
            if(vis[ny][nx] != 0) continue;

            q.push({ny, nx});
            vis[ny][nx] = vis[cur.first][cur.second] + 1;
        }
    }

    // JiHoon
    q.push(start);
    exits[start.first][start.second] = 1;

    while(!q.empty()) {
        pair<int, int> cur = q.front();
        if(cur.first == 0 || cur.first == R - 1 || cur.second == 0 || cur.second == C - 1) {
            cout << exits[cur.first][cur.second];
            return 0;
        }
        q.pop();

        for(int dir = 0; dir < 4; dir++) {
            int ny = cur.first + dy[dir];
            int nx = cur.second + dx[dir];

            if(ny < 0 || ny >= R || nx < 0 || nx >= C) continue;
            if(board[ny][nx] == 'F' || board[ny][nx] == '#')continue;
            if(exits[ny][nx] != 0) continue;
            if(vis[ny][nx] != 0) {
                if(vis[ny][nx] <= exits[cur.first][cur.second] + 1) continue;
            }

            q.push({ny, nx});
            exits[ny][nx] = exits[cur.first][cur.second] + 1;
        }
    }

    cout << "IMPOSSIBLE";

    return 0;
}
