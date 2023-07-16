#include <algorithm>
#include <iostream>

using namespace std;

int T, N;
int state[100002];
int s[100002];

void dfs(int start, int current) {
    while(true) {
        state[current] = start;
        current = s[current];

        if(state[current] == start) {
            while(state[current] != -1) {
                state[current] = -1;
                current = s[current];
            }
            return;
        } else if(state[current] != 0) return;
    }    
}

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> T;
    for(int i = 0; i < T; i++) {
        cin >> N;
        for(int j = 1; j <= N; j++) {
            cin >> s[j];
        }
        fill(state, state + N + 1, 0);

        for(int j = 1; j <= N; j++) {
            if(state[j] == 0) dfs(j, j);
        }

        int answer = 0;
        for(int j = 1; j <= N; j++) {
            if(state[j] != -1) answer++;
        }

        cout << answer << '\n';
    }

    return 0;
}