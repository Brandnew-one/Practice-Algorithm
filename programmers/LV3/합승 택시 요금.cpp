#include <algorithm>
#include <string>
#include <vector>

using namespace std;

int d[202][202];
const int INF = 100001 * 200;

int solution(int n, int s, int a, int b, vector<vector<int>> fares) {
    for(int i = 1; i <= n; i++) {
        fill(d[i], d[i] + 1 + n, INF);
    }
    
    for(int i = 1; i <= n; i++) {
        d[i][i] = 0;
    }
    
    for(int i = 0; i < fares.size(); i++) {
        d[fares[i][0]][fares[i][1]] = fares[i][2];
        d[fares[i][1]][fares[i][0]] = fares[i][2];
    }
    
    for(int k = 1; k <= n; k++) {
        for(int i = 1; i <= n; i++) {
            for(int j = 1; j <= n; j++) {
                if(d[i][j] > d[i][k] + d[k][j]) {
                    d[i][j] = d[i][k] + d[k][j];
                }
            }
        }
    }
    
    int answer = INF;
    for(int i = 1; i <= n; i++) {
        answer = min(d[s][i] + d[i][a] + d[i][b], answer);
    }
    
    return answer;
}