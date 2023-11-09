#include <iostream>
#include <string>

using namespace std;

int n, m;
int answer;
int board[502][502];
bool vis[502][502];

void dfs(int y, int x, int cnt, int sum) {
    if(cnt == 4) { 
        answer = max(answer, sum); 
        return;
    }
    // up
  if(y - 1 >= 0 && !vis[y - 1][x]) {
    vis[y - 1][x] = true;
    dfs(y - 1, x, cnt + 1, sum + board[y - 1][x]);
    vis[y - 1][x] = false;
  }

  // down
  if(y + 1 < n && !vis[y + 1][x]) {
    vis[y + 1][x] = true;
    dfs(y + 1, x, cnt + 1, sum + board[y + 1][x]);
    vis[y + 1][x] = false;
  }

  // left
  if(x - 1 >= 0 && !vis[y][x - 1]) {
    vis[y][x - 1] = true;
    dfs(y, x - 1, cnt + 1, sum + board[y][x - 1]);
    vis[y][x - 1] = false;
  }

  // right
  if(x + 1 < m && !vis[y][x + 1]) {
    vis[y][x + 1] = true;
    dfs(y, x + 1, cnt + 1, sum + board[y][x + 1]);
    vis[y][x + 1] = false;
  }
}

int checkCross(int y, int x) {
    int sum = 0;
    if(y + 2 < n && x - 1 >= 0) {
        sum = max(sum, board[y][x] + board[y + 1][x] + board[y + 2][x] + board[y + 1][x - 1]);
    }

    if (x + 2 < m && y - 1 >= 0) {
        sum = max(sum, board[y][x] + board[y][x + 1] + board[y][x + 2] + board[y - 1][x + 1]);
    }

    if(y + 2 < n && x + 1 < m) {
        sum = max(sum, board[y][x] + board[y + 1][x] + board[y + 2][x] + board[y + 1][x + 1]);
    }

    if(x + 2 < m && y + 1 < n) {
        sum = max(sum, board[y][x] + board[y][x + 1] + board[y][x + 2] + board[y + 1][x + 1]);
    }

  return sum;
}

void initVis() {
    for(int y = 0; y < n; y++) {
        for(int x = 0; x < m; x++) {
            vis[y][x] = 0;
        }
    }
}


int main(void) {
    ios::sync_with_stdio(0);
    cin.tie(0);

    cin >> n >> m;
    for(int y = 0; y < n; y++) {
        for(int x = 0; x < m; x++) {
            cin >> board[y][x];
        }
    }

    for(int y = 0; y < n; y++) {
        for(int x = 0; x < m; x++) {
            vis[y][x] = 1;
            dfs(y, x, 1, board[y][x]);
            answer = max(answer, checkCross(y, x));
            initVis();
        }
    }

    cout << answer;

    return 0;
}