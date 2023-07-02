#include <algorithm>
#include <vector>
#include <queue>

using namespace std;

int vis[20002];

int solution(int n, vector<vector<int>> edge) {
    fill(vis, vis + 20001, -1);
    vector<int> adj[n + 1];
    for(int i = 0; i < edge.size(); i++) {
        adj[edge[i][0]].push_back(edge[i][1]);
        adj[edge[i][1]].push_back(edge[i][0]);
    }
    
    queue<int> q;
    q.push(1);
    vis[1] = 0;
    
    while(!q.empty()) {
        int cur = q.front();
        q.pop();
        
        for(int i = 0; i < adj[cur].size(); i++) {
            int next = adj[cur][i];
            if(vis[next] != -1) continue;
            q.push(next);
            vis[next] = vis[cur] + 1;
        }
    }
    
    int max = *max_element(vis, vis + 20001);
    int answer = 0;
    for(int i = 1; i <= n; i++) {
        if(vis[i] == max) {
            answer++;
        }
    }
    
    return answer;
}