#include <algorithm>
#include <iostream>
#include <queue>

using namespace std;

int d[100002];
int N, K;

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> N >> K;
    fill(d, d + 100002, -1);

    queue<int> q;
    q.push(N);
    d[N] = 0;

    while(!q.empty()) {
        int cur = q.front();
        if(cur == K) break;
        int next;
        q.pop();

        for(int dir = 0; dir < 3; dir++) {
            if(dir == 0) next = cur + 1;
            else if(dir == 1) next = cur - 1;
            else next = cur * 2;

            if(next < 0 || next > 100000) continue;
            if(d[next] != -1)continue;
            q.push(next);
            d[next] = d[cur] + 1;
        }
    }

    cout << d[K];

    return 0;
}