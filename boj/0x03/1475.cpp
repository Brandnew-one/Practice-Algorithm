#include <iostream>
#include <string>

// c++로 오랜만에 푸니까 (int)s[i]이 아스키 코드값의 int가 나올거라고 예상하지 못했다.

using namespace std;

int d[10];
string s;
int answer = 0;

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> s;
    for(int i = 0; i < s.length(); i++) {
        d[(int)s[i] - '0']++;
    }
    d[6] = d[6] + d[9];
    if(d[6] % 2 == 0) {
        d[6] = d[6] / 2;
    } else {
        d[6] = d[6] / 2 + 1;
    }
    d[9] = 0;

    for(int i = 0; i < 10; i++) {
        if(d[i] >= answer) answer = d[i];
    }

    cout << answer;

    return 0;
}