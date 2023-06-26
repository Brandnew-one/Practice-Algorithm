#include <bits/stdc++.h>

using namespace std;

/*
    다시 풀어보기 -> 비선점 SJF 스케줄링
    https://wonit.tistory.com/104
*/


struct cmp {
    bool operator()(vector<int> a,vector<int> b) {
        return a[1] > b[1];
    }
};

int solution(vector<vector<int>> jobs) {
    sort(jobs.begin(), jobs.end());
    priority_queue<vector<int>, vector<vector<int>>, cmp> pq;
    
    int index = 1;
    int answer = jobs[0][1];
    int time = jobs[0][0] + jobs[0][1];
    
    while(index < jobs.size() || !pq.empty()) {
        while(true) {
            if(index >= jobs.size() || time < jobs[index][0]) break;
            pq.push(jobs[index]);
            index++;
        }
        
        if(pq.empty()) {
            time = jobs[index][0] + jobs[index][1];
            answer += time - jobs[index][0];
            index++;
        } else {
            time += pq.top()[1];
            answer += time - pq.top()[0];
            pq.pop();
        }
    }
    
    return answer / jobs.size();
}