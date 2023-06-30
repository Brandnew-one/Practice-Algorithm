#include <iostream>
#include <string>
#include <sstream>
#include <deque>
#include <vector>

using namespace std;

int T, n;
string p;

string check(string x, string command) {
    x = x.substr(1, x.size() - 2); // [] 제거
    istringstream ss(x);
    string buffer;
    deque<int> dq;

    while(getline(ss, buffer, ',')) {
        dq.push_back(stoi(buffer));
    }
    bool reversed = 0;

    for(int i = 0; i < command.size(); i++) {
        if(command[i] == 'R') {
            reversed = !reversed;
        } else {
            if(dq.empty()) return "error";
            if(reversed) { dq.pop_back(); }
            else { dq.pop_front(); }
        }
    }

    string answer;
    if(reversed) {
        while(!dq.empty()) {
            string s = to_string(dq.back());
            dq.pop_back();
            if(dq.empty()) {
                answer += s;    
            } else {
                answer += s;
                answer += ",";
            }
        }
    } else {
        while(!dq.empty()) {
            string s = to_string(dq.front());
            dq.pop_front();
            if(dq.empty()) {
                answer += s;    
            } else {
                answer += s;
                answer += ",";
            }
        }
    }

    return "[" + answer + "]";

}

int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> T;
    for(int i = 0; i < T; i++) {
        cin >> p;
        cin >> n;
        cin.ignore();

        string x;
        getline(cin, x);
        cout << check(x, p) << '\n';
    }

    return 0;
}