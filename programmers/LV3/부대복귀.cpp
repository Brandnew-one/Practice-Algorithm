#include <algorithm>
#include <string>
#include <vector>
#include <queue>

using namespace std;

vector<int> v[100002];
int vis[100002];

vector<int> solution(int n, vector<vector<int>> roads, vector<int> sources, int destination) {
    for(int i = 0; i < roads.size(); i++) {
        v[roads[i][0]].push_back(roads[i][1]);
        v[roads[i][1]].push_back(roads[i][0]);
    }
    
    vector<int> answer;
    for(int i = 0; i < sources.size(); i++) {
        fill(vis, vis + 100002, 0);
        queue<int> q;
        q.push(sources[i]);
        vis[sources[i]] = 1;
        
        while(!q.empty()) {
            if(vis[destination] != 0) break;
            
            int cur = q.front();
            q.pop();
            
            for(int j = 0; j < v[cur].size(); j++) {
                int next = v[cur][j];
                if(vis[next] != 0) continue;
                q.push(next);
                vis[next] = vis[cur] + 1;
            }
        }
        if(vis[destination] != 0) {
            answer.push_back(vis[destination] - 1);
        } else {
            answer.push_back(-1);
        }
    }
    
    return answer;
}


// MARK: - 시간복잡도 개선
/// 도착지 = 1, 출발 = n -> 도착지로 부터 모든 거리를 파악하고 있으면 n번의 bfs 수행이 필요없음
#include <algorithm>
#include <string>
#include <vector>
#include <queue>

using namespace std;

vector<int> v[100002];
int vis[100002];

vector<int> solution(int n, vector<vector<int>> roads, vector<int> sources, int destination) {
    for(int i = 0; i < roads.size(); i++) {
        v[roads[i][0]].push_back(roads[i][1]);
        v[roads[i][1]].push_back(roads[i][0]);
    }
    
    queue<int> q;
    q.push(destination);
    vis[destination] = 1;
    
    while(!q.empty()) {
        int cur = q.front();
        q.pop();
        
        for(int i = 0; i < v[cur].size(); i++) {
            int next = v[cur][i];
            if(vis[next] != 0) continue;
            q.push(next);
            vis[next] = vis[cur] + 1;
        }
    }
    
    vector<int> answer;
    for(int i = 0; i < sources.size(); i++) {
        if(vis[sources[i]] == 0) {
            answer.push_back(-1);
        } else {
            answer.push_back(vis[sources[i]] - 1);
        }
    }
    
    return answer;
}