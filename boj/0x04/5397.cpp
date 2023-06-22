#include <iostream>
#include <list>

using namespace std;

int n;

void solution(string &s) {
    list<char> L = {};
    list<char>::iterator it = L.begin();

    for(int i = 0; i < s.size(); i++) {
        if(s[i] == '<') {
            if(it != L.begin()) {
                it--;
            }
        } else if(s[i] == '>') {
            if(it != L.end()) {
                it++;
            }
        } else if(s[i] == '-') {
            if(it == L.begin()) continue;
            it--;
            it = L.erase(it);
        } else {
            L.insert(it, s[i]);
        }
    }

    for(list<char>::iterator t = L.begin(); t != L.end(); t++) {
        cout << *t;
    }
    cout << '\n';
}

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> n;
    for(int i = 0; i < n; i++) {
        string s;
        cin >> s;
        solution(s);
    }

    return 0;
}