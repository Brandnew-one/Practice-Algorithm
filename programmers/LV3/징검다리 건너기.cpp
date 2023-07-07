#include <algorithm>
#include <string>
#include <vector>

using namespace std;

// O(m * n)
// m = log2(2 * 10^8), n = 2 * 10^5

bool check(vector<int> &stones, int mid, int k) {
    vector<int> v;
    int cnt = 0;
    for(int i = 0; i < stones.size(); i++) {
        if(stones[i] - mid < 0) cnt++;
        else cnt = 0;
        if(cnt >= k) return 0;
    }
    return 1;
}

int solution(vector<int> stones, int k) {
    int min_stone = 0;
    int max_stone = *max_element(stones.begin(), stones.end());

    while(min_stone <= max_stone) {
        int mid = (min_stone + max_stone) / 2;
        if(check(stones, mid, k)) {
            min_stone = mid + 1;
        } else {
            max_stone = mid - 1;
        }
    }
    
    return max_stone;
}