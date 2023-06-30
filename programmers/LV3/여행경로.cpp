#include <bits/stdc++.h>

using namespace std;
/*
백트랙킹 문제 오랜만에 풀어서 구현하는데 시간이 좀 걸렸다..
*/

bool vis[10000];
vector<string> answer;
vector<vector<string>> answerArr;

void dfs(vector<vector<string>>& tickets, string current, int cnt) {
    if(cnt == tickets.size()) {
        answerArr.push_back(answer);
        return;
    } 
    
    for(int i = 0; i < tickets.size(); i++) {
        if(tickets[i][0] == current && !vis[i]) {
            vis[i] = 1;
            answer.push_back(tickets[i][1]);
            dfs(tickets, tickets[i][1], cnt + 1);
            vis[i] = 0;
            answer.pop_back();
        }
    }
}

vector<string> solution(vector<vector<string>> tickets) {
    sort(tickets.begin(), tickets.end());
    
    answer.push_back("ICN");
    for(int i = 0; i < tickets.size(); i++) {
        if(tickets[i][0] == "ICN") {
            vis[i] = 1;
            answer.push_back(tickets[i][1]);
            dfs(tickets, tickets[i][1], 1);
            vis[i] = 0;
            answer.pop_back();
        }
    }
    
    return answerArr[0];
}