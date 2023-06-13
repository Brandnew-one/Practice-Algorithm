#include <string>
#include <vector>
#include <queue>
#include <utility>

using namespace std;

typedef pair<int, int> Point;
int dy[4] = {-1, 1, 0 ,0};
int dx[4] = {0, 0, -1, 1};

int bfs(vector<string> maps, Point start, Point end) {
    vector<vector<int>> vis(maps.size(), vector<int>(maps[0].size(), -1));
    queue<pair<int, int>> q;
    
    q.push({start.first, start.second});
    vis[start.first][start.second] = 0;
    
    while(!q.empty()) {
        pair<int, int> cur = q.front();
        q.pop();
        
        for(int dir = 0; dir < 4; dir++) {
            int ny = cur.first + dy[dir];
            int nx = cur.second + dx[dir];
            
            if(ny < 0 || nx < 0 || ny >= maps.size() || nx >= maps[0].size()) continue;
            if(vis[ny][nx] != -1) continue;
            if(maps[ny][nx] == 'X') continue;
            
            q.push({ny, nx});
            vis[ny][nx] = vis[cur.first][cur.second] + 1;
        }
    }
    
    return vis[end.first][end.second];
}

int solution(vector<string> maps) {
    Point start, lever, end;
    
    for(int y = 0; y < maps.size(); y++) {
        for(int x = 0; x < maps[0].size(); x++) {
            if(maps[y][x] == 'S') {
                start.first = y;
                start.second = x;
            }
            
            if(maps[y][x] == 'L') {
                lever.first = y;
                lever.second = x;
            }
            
            if(maps[y][x] == 'E') {
                end.first = y;
                end.second = x;
            }
        }
    }
    
    int to_lever = bfs(maps, start, lever);
    int to_end = bfs(maps, lever, end);
    
    if(to_lever != -1 && to_end != -1) {
        return to_lever + to_end;
    } else {
        return -1;
    }
}