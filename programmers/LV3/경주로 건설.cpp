#include <string>
#include <utility>
#include <vector>
#include <queue>

using namespace std;

int vis[4][27][27];
int dy[4] = {-1, 1, 0, 0};
int dx[4] = {0, 0, -1, 1};

int solution(vector<vector<int>> board) {
    queue<pair<pair<int, int>, int>> q; // 0, 1, 2, 3
    q.push({{0, 0}, -1});
    for(int dir = 0; dir < 4; dir++) {
        vis[dir][0][0] = 100;
    }
    
    while(!q.empty()) {
        pair<int, int> cur = q.front().first;
        int prev_dir = q.front().second;
        q.pop();
        
        for(int dir = 0; dir < 4; dir++) {
            int ny = cur.first + dy[dir];
            int nx = cur.second + dx[dir];
            
            if(ny < 0 || ny >= board.size() || nx < 0 || nx >= board.size()) continue;
            if(board[ny][nx] == 1) continue;
            if(vis[dir][ny][nx] != 0) {
                int price;
                if(prev_dir == -1) price = 100;
                else if(prev_dir == dir) price = 100;
                else price = 600;
                
                if(vis[dir][ny][nx] > vis[prev_dir][cur.first][cur.second] + price) {
                    vis[dir][ny][nx] = vis[prev_dir][cur.first][cur.second] + price;
                    q.push({{ny, nx}, dir});
                }
            } else {
                int price;
                if(prev_dir == -1) price = 100;
                else if(prev_dir == dir) price = 100;
                else price = 600;

                vis[dir][ny][nx] = vis[prev_dir][cur.first][cur.second] + price;
                q.push({{ny, nx}, dir});
            }
        }
    }
    
    int answer = 0x7fffffff;
    for(int dir = 0; dir < 4; dir++) {
        if(vis[dir][board.size() - 1][board.size() - 1] == 0) continue;
        if(vis[dir][board.size() - 1][board.size() - 1] < answer) {
            answer = vis[dir][board.size() - 1][board.size() - 1];
        }
    }
    
    return answer;
}