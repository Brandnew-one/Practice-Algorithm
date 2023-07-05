#include <string>
#include <set>
#include <vector>

using namespace std;

// N의 크기가 8이기 때문에 백트랙킹을 어떻게 활용할지 고민
// banned_id에 가능한 user들을 담고 백트랙킹 하는 방향으로 코드 작성함

vector<int> v[8];
vector<string> user_ids;
set<vector<string>> s;
bool vis[8];
int m, answer;

bool check(string user, string ban) {
    if(user.size() != ban.size()) return 0;
    for(int i = 0; i < ban.size(); i++) {
        if(ban[i] == '*') continue;
        if(user[i] != ban[i]) return 0;
    }
    return 1;
}

void dfs(int cnt) {
    if(cnt == m) {
        vector<string> temp;
        for(int i = 0; i < 8; i++) {
            if(vis[i]) temp.push_back(user_ids[i]);
        }
        s.insert(temp);
        return;
    }
    
    for(int i = 0; i < v[cnt].size(); i++) {
        int index = v[cnt][i];
        if(vis[index]) continue;
        vis[index] = 1;
        dfs(cnt + 1);
        vis[index] = 0;
    }
}

int solution(vector<string> user_id, vector<string> banned_id) {
    user_ids = user_id;
    m = banned_id.size();
    for(int i = 0; i < banned_id.size(); i++) {
        for(int j = 0; j < user_id.size(); j++) {
            if(check(user_id[j], banned_id[i])) {
                v[i].push_back(j);
            }
        }
    }
    
    for(int i = 0; i < v[0].size(); i++) {
        vis[v[0][i]] = 1;
        dfs(1);
        vis[v[0][i]] = 0;
    }
    
    return s.size();
}