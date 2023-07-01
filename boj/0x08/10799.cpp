#include <iostream>
#include <stack>
#include <string>

using namespace std;

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    int answer = 0;
    string s;
    cin >> s;
    
    stack<char> st;
    for(int i = 0; i < s.size(); i++) {
        if(s[i] == '(') st.push(s[i]);
        else {
            if(!st.empty()) {
                if(s[i - 1] == '(') {
                    st.pop();
                    answer += st.size();
                } else {
                    st.pop();
                    answer += 1;
                }
            }
        }
    }

    cout << answer;
    return 0;
}