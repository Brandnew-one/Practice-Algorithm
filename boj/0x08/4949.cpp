#include <iostream>
#include <stack>
#include <string>

using namespace std;

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);
    
    string s;

    while(1) {
        getline(cin, s);
        if(s == ".") { break; }

        stack<char> sa;
        bool flag = 1;
        for(int i = 0; i < s.size(); i++) {
            if(s[i] == '[' || s[i] == '(') {
                sa.push(s[i]);
            } else if(s[i] == ']') {
                if(sa.empty()) {
                    flag = 0;
                    break;
                } else {
                    if(sa.top() == '[') { sa.pop(); }
                    else {
                        flag = 0;
                        break;
                    }
                }
            } else if(s[i] == ')') {
                if(sa.empty()) {
                    flag = 0;
                    break;
                } else {
                    if(sa.top() == '(') { sa.pop(); }
                    else {
                        flag = 0;
                        break;
                    }
                }
            }
        }
        if(sa.empty() && flag) {
            cout << "yes" << '\n';
        } else {
            cout << "no" << '\n';
        }
    }

    return 0;
}