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