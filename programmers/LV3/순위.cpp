#include <string>
#include <vector>
#include <queue>

using namespace std;

// 다시 풀어보기!

bool d [102][102];

int solution(int n, vector<vector<int>> results) {
    for(int i = 0; i < results.size(); i++) {
        d[results[i][0]][results[i][1]] = 1;
    }
    
    for(int k = 1; k <= n; k++) {
        for(int y = 1; y <= n; y++) {
            for(int x = 1; x <= n; x++) {
                if(d[y][x] == 1) continue;
                if(d[y][k] && d[k][x]) d[y][x] = 1;
            }
        }
    }
    
    int answer = 0;
    for(int k = 1; k <= n; k++) {
        int win = 0, lose = 0;
        for(int x = 1; x <= n; x++) {
            if(d[k][x] == 1) win++;
        }
        for(int y = 1; y <= n; y++) {
            if(d[y][k] == 1) lose++;
        }
        if(win + lose == n - 1) answer++;
    }
    
    return answer;
}