#include <iostream>
#include <vector>
#include <functional>
#include <queue>

using namespace std;

int solution(int n, int k, vector<int> enemy) {
    int answer = 0;
    int tempN = n;
    int tempK = k;
    priority_queue<int> pq;
    
    for(int i = 0; i < enemy.size(); i++) {
        if(tempN - enemy[i] >= 0) {
            pq.push(enemy[i]);
            tempN -= enemy[i];
            answer += 1;
        } else {
            if(tempK > 0) {
                pq.push(enemy[i]);
                tempN -= enemy[i];
                answer += 1;

                tempN += pq.top();
                tempK -= 1;
                pq.pop();
            } else {
                break;
            }
        }
    }
    
    return answer;
}

int main() {
    vector<int> v = { 4, 2, 4, 5, 3, 3, 1 };
    cout << solution(7, 3, v);
    return 0;
}