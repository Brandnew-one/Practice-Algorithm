#include <string>
#include <vector>
#include <algorithm>

using namespace std;

bool comp(vector<int> a, vector<int> b) {
    if(a[1] == b[1]) {
        return a[0] < b[0];
    } else {
        return a[1] < b[1];
    }
}

int solution(vector<vector<int>> targets) {
    sort(targets.begin(), targets.end(), comp);
    int ref = targets[0][1];
    int answer = 1;
    
    for(int i = 0; i < targets.size(); i++) {
        if(targets[i][0] >= ref) {
            answer++;
            ref = targets[i][1];
        }
    }
    
    return answer;
}