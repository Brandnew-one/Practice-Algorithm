#include <string>
#include <vector>
#include <queue>
#include <utility>
#include <iostream>

using namespace std;

typedef pair<int, int> Point;

vector<string> boardArr;
int n, m;
int vis[102][102] = {-1, };

Point move(int dir, Point start) {
    Point position = start;
    if(dir == 0) { // UP
        if(position.first == 0) { return position; }
        while(boardArr[position.first][position.second] != 'D') {
            if(position.first <= 0) break;
            position.first--;
        }
        if(position.first == 0 && boardArr[position.first][position.second] == 'D') {
            position.first++;
        } else if(position.first != 0) {
            position.first++;
        }
        return position;        
    } else if(dir == 1) { // DOWN
        if(position.first == n - 1) { return position; }
         while(boardArr[position.first][position.second] != 'D') {
            if(position.first >= n - 1) break;
            position.first++;
        }
        if(position.first == n - 1 && boardArr[position.first][position.second] == 'D') {
            position.first--;
        } else if(position.first != n - 1) {
            position.first--;
        }
        return position;
    } else if(dir == 2) { // LEFT
        if(position.second == 0) { return position; }
        while(boardArr[position.first][position.second] != 'D') {
            if(position.second <= 0) break;
            position.second--;
        }
        if(position.second == 0 && boardArr[position.first][position.second] == 'D') {
            position.second++;
        } else if(position.second != 0) {
            position.second++;
        }
        return position;
    } else { // RIGHT
        if(position.second == m - 1) { return position; }
        while(boardArr[position.first][position.second] != 'D') {
            if(position.second >= m - 1) break;
            position.second++;
        }
        if(position.second == m - 1 && boardArr[position.first][position.second] == 'D') {
            position.second--;
        } else if(position.second != m - 1) {
            position.second--;
        }
        return position;
    }
}

int solution(vector<string> board) {
    boardArr = board;
    n = boardArr.size();
    m = boardArr[0].size();
    for(int y = 0; y < n; y++) {
        for(int x = 0; x < m; x++) {
            vis[y][x] = -1;
        }
    }
    
    Point start;
    Point end;
    for(int y = 0; y < n; y++) {
        for(int x = 0; x < m; x++) {
            if(boardArr[y][x] == 'R') {
                start = {y, x};
            }
            if(boardArr[y][x] == 'G') {
                end = {y, x};
            }
        }
    }
    
    queue<Point> q;
    q.push(start);
    vis[start.first][start.second] = 0;
    
    while(!q.empty()) {
        Point cur = q.front();
        q.pop();
        
        for(int dir = 0; dir < 4; dir++) {
            Point dPosition = move(dir, cur);
            int ny = dPosition.first;
            int nx = dPosition.second;
            
            if(ny < 0 || ny >= n || nx < 0 || nx >= m) continue;
            if(vis[ny][nx] != -1) continue;
            
            q.push(dPosition);
            vis[ny][nx] = vis[cur.first][cur.second] + 1;
        }
    }
    
    return vis[end.first][end.second];
}