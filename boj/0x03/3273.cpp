#include <iostream>
#include <vector>

using namespace std;

bool d[2000002];
int n, x;
int answer = 0;

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    vector<int> v;
    cin >> n;
    for(int i = 0; i < n; i ++) {
        int temp;
        cin >> temp;
        d[temp] = 1;
        v.push_back(temp);
    }
    cin >> x;

    for(int i = 0; i < n; i++) {
        if((v[i] < x) && d[x - v[i]]) answer++;
        // if(d[x - v[i]]) answer++;
    }

    cout << answer / 2;

    return 0;
}