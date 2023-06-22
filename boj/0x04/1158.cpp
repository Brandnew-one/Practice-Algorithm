#include <iostream>
#include <list>

using namespace std;

int N, K;

int main(void) {
    cin >> N >> K;

    list<int> L;
    for(int i = 1; i <= N; i++) {
        L.push_back(i);
    }

    cout << '<';
    list<int>::iterator it = L.begin();
    while(L.size() != 1) {
        for(int i = 1; i < K; i++) {
            it++;
            if(it == L.end()) {
                it = L.begin();
            }
        }
        cout << *it << ", ";
        it = L.erase(it);
        if(it == L.end()) it = L.begin();
    }
    cout << *L.begin() << '>';

    return 0;
}