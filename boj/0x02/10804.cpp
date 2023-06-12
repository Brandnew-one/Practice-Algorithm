#include <iostream>
#include <vector>

using namespace std;

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    int arr[21];
    for(int i = 1 ; i < 21; i++) {
        arr[i] = i;
    }

    for(int i = 0; i < 10; i++) {
        int a, b;
        cin >> a >> b;
        vector<int> v;

        for(int i = a; i <= b; i++) {
            v.push_back(arr[i]);
        }

        for(int i = 0; i <= b - a; i++) {
            arr[b - i] = v[i];
        }
    }

    for(int i = 1; i < 21; i++) {
        cout << arr[i] << ' ';
    }

    return 0;
}