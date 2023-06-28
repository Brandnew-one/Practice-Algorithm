#include <bits/stdc++.h>

using namespace std;

struct cmp {
    bool operator()(vector<int> a, vector<int> b) {
        return a[2] > b[2];
    }
};

bool vis[100];
vector<pair<int, int>> adj[100]; // 노드, 비용

int solution(int n, vector<vector<int>> costs) {
    for(int i = 0; i < costs.size(); i++) {
        adj[costs[i][0]].push_back({costs[i][1], costs[i][2]});
        adj[costs[i][1]].push_back({costs[i][0], costs[i][2]});
    }
    
    int cnt = 0;
    priority_queue<vector<int>, vector<vector<int>>, cmp> pq;  // 노드1, 노드2, 비용
    
    vis[0] = true;
    for(int i = 0; i < adj[0].size(); i++) {
        pq.push({0, adj[0][i].first, adj[0][i].second});
    }
    
    int answer = 0;
    while(cnt < n - 1) {
        int next = pq.top()[1];
        int cost = pq.top()[2];
        pq.pop();
        if(vis[next]) continue;
        
        answer += cost;
        vis[next] = 1;
        cnt++;
        for(int i = 0; i < adj[next].size(); i++) {
            pq.push({next, adj[next][i].first, adj[next][i].second});
        }
    }
    
    return answer;
}