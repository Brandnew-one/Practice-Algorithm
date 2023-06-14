#include <string>
#include <vector>
#include <utility>
#include <iostream>

using namespace std;

typedef pair<int, int> Point;

vector<vector<Point>> coordinate = {
    {{0, 0}, {0, 1}, {0, 2}},
    {{1, 0}, {1, 1}, {1, 2}},
    {{2, 0}, {2, 1}, {2, 2}},
    
    {{0, 0}, {1, 0}, {2, 0}},
    {{0, 1}, {1, 1}, {2, 1}},
    {{0, 2}, {1, 2}, {2, 2}},
    
    {{0, 0}, {1, 1}, {2, 2}},
    {{2, 0}, {1, 1}, {0, 2}}
};

bool compO(string s) {
    // (s[0] == s[1] && s[1] == s[2]) && s[0] == 'O';
    if((s[0] == s[1] && s[1] == s[2]) && s[0] == 'O') return true;
    return false;
}

bool compX(string s) {
    // (s[0] == s[1] && s[1] == s[2]) && s[0] == 'X';
    if((s[0] == s[1] && s[1] == s[2]) && s[0] == 'X') return true;
    return false;
}

int solution(vector<string> board) {
    int oCount = 0;
    int xCount = 0;
    
    for(int y = 0; y < 3; y++) {
        for(int x = 0; x < 3; x++) {
            if(board[y][x] == 'O') oCount++;
            if(board[y][x] == 'X') xCount++;
        }
    }
    
    if(xCount > oCount) { return 0; }
    else if(oCount >= xCount + 2) { return 0; }
    else if(oCount == xCount + 1) {
        // x가 이겼는데 o를 두는 경우
        for(int y = 0; y < 8; y++) {
            string s;
            for(int x = 0; x < 3; x++) {
                s += board[coordinate[y][x].first][coordinate[y][x].second];
            }
            if(compX(s)) { return 0; }
        }
        return 1;
    }
    else if(oCount == xCount) {
        // o가 이겼는데 x를 두는 경우
        for(int y = 0; y < 8; y++) {
            string s;
            for(int x = 0; x < 3; x++) {
                s += board[coordinate[y][x].first][coordinate[y][x].second];
            }
            if(compO(s)) { return 0; }
        }
        return 1;
    }
    else { return 1; }
}