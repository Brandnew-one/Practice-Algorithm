#include <algorithm>
#include <string>
#include <vector>

using namespace std;


vector<int> solution(int n, int s) {    
    int q = s / n;
    int r = s % n;

    vector<int> answer;
    if(q == 0) answer.push_back(-1);
    else {
        for(int i = 0; i < n; i++) {
            answer.push_back(q);
        }
        for(int i = 0; i < r; i++) {
            answer[i]++;
        }
        sort(answer.begin(), answer.end());
    }

    return answer;
}