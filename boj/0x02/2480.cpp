#include <iostream>

using namespace std;

// 지역변수 배열을 선언하고 값을 할당하지 않으면 쓰레기값으로 채워진다.
// cin >> a >> b >> c; cin은 공백을 기준으로 처리된다

int main() {
    ios::sync_with_stdio(0);
    cin.tie(0);

    int arr[7] = {0,}; 
    int max = 0;

    for(int i = 0; i < 3; i++) {
        int input;
        cin >> input;
        arr[input] += 1;
    }

    for(int i = 1; i < 7; i++) {
        if(arr[i] == 3) {
            cout << 10000 + i * 1000;
            return 0;
        } else if(arr[i] == 2) {
            cout << 1000 + i * 100;
            return 0;
        } else if(arr[i] == 1) {
            max = i;
        }
    }

    cout << max * 100;

    return 0;
}