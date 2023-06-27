#include <algorithm>
#include <iostream>
#include <stack>
#include <vector>

using namespace std;

int N;
int arr[1000002];

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> N;
    for(int i = 1; i <= N; i++) {
        cin >> arr[i];
    }

    stack<int> s;
    vector<int> answer;

    s.push(arr[N]);
    answer.push_back(-1);

    for(int i = N - 1; i > 0; i--) {
        while(!s.empty()) {
            if(s.top() > arr[i]) {
                answer.push_back(s.top());
                s.push(arr[i]);
                break;
            }
            s.pop();
        }

        if(s.empty()) {
            answer.push_back(-1);
            s.push(arr[i]);
        }
    }

    reverse(answer.begin(), answer.end());
    for(int i = 0; i < answer.size(); i++) {
        cout << answer[i] << ' ';
    }

    return 0;
}