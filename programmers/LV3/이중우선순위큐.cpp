#include<bits/stdc++.h>

using namespace std;

priority_queue<int> pq;

void chageSign() {
    priority_queue<int> temp;
    while(!pq.empty()) {
        int changed = pq.top() * -1;
        pq.pop();
        temp.push(changed);
    }
    pq = temp;
}

vector<int> solution(vector<string> operations) {
    for(int i = 0; i < operations.size(); i++) {
        if(operations[i][0] == 'I') { // insert
            string s;
            for(int j = 2; j < operations[i].size(); j++) {
                s += operations[i][j];
            }
            pq.push(stoi(s));
        } else {
            if(operations[i][2] == '-') { // minpop
                if(!pq.empty()) {
                    chageSign();
                    pq.pop();
                    chageSign();
                }
            } else { // maxpop
                if(!pq.empty()) {
                    pq.pop();
                }
            }
        }
    }
    
    vector<int> answer;
    if(pq.empty()) {
        answer.push_back(0);
        answer.push_back(0);
    } else {
        answer.push_back(pq.top());
        chageSign();
        answer.push_back(pq.top() * -1);
    }
    
    return answer;
}