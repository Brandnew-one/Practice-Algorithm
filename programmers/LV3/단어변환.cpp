#include <string>
#include <vector>
#include <queue>
#include <iostream>

using namespace std;

bool vis[52];

bool check(string a, string b) {
    int cnt = 0;
    for(int i = 0; i < a.size(); i++) {
        if(a[i] != b[i]) cnt++;
    }
    return cnt > 1 ? false : true;
}

int solution(string begin, string target, vector<string> words) {
    int answer_idx = -1;
    for(int i = 0; i < words.size(); i++) {
        if(words[i] == target) answer_idx = i;
    }
    if(answer_idx == -1) return 0;
    
    queue<pair<string, int>> q;
    q.push({begin, 0});
    
    while(!q.empty()) {
        string cur = q.front().first;
        int cnt = q.front().second;
        q.pop();
        
        if(cur == target) return cnt;
        
        for(int i = 0; i < words.size(); i++) {
            if(vis[i])continue;
            if(check(cur, words[i])) {
                q.push({words[i], cnt + 1});
                vis[i] = true;
            }
        }
    }
    
    return 0;
}