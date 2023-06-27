#include <iostream>
#include <stack>

using namespace std;

int N;
int arr[80002];
long long answer = 0;

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> N;
    for(int i = 1; i <= N; i++) cin >> arr[i];

    stack<int> s;
    s.push(arr[1]);

    for(int i = 2; i <= N; i++) {
        while(!s.empty()) {
            if(s.top() > arr[i]) break;
            s.pop();
        }
        answer += s.size();
        s.push(arr[i]);
    }

    cout << answer;

    return 0;
}


// 시간초과 풀이
// 오큰수랑 동일한 방법으로 풀어보려고 했으나 시간초과 발생
/*
int N;
int arr[80002];
int answer[80002];

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> N;
    for(int i = 1; i <= N; i++) cin >> arr[i];

    stack<int> s;
    answer[N] = 0;
    s.push(arr[N]);

    for(int i = N - 1; i > 0; i--) {
        stack<int> temp = s;
        int cnt = 0;

        while(!temp.empty()) {
            if(temp.top() >= arr[i]) break;
            temp.pop();
            cnt++;
        }
        s.push(arr[i]);
        answer[i] = cnt;
    }

    int sum = 0;
    for(int i = 1; i <= N; i++) sum += answer[i];

    cout << sum;

    return 0;
}
*/

// 위의 방법에서 시간초과 풀이 but, 오답
/*
#include <iostream>
#include <stack>
#include <utility>

using namespace std;

int N;
int arr[80002];
long long answer = 0;

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> N;
    for(int i = 1; i <= N; i++) cin >> arr[i];

    stack<pair<int, int>> s;
    s.push({arr[N], N});

    for(int i = N - 1; i > 0; i--) {
        while(!s.empty()) {
            if(s.top().first > arr[i]) break;
            answer += s.top().second - i;
            s.pop();
        }
        s.push({arr[i], i});
    }

    cout << answer;

    return 0;
}
*/