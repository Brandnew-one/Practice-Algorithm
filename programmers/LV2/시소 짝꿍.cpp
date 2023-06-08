#include <string>
#include <vector>
#include <map>

using namespace std;

long long combination(long long n) {
    return (long long)(n * (n - 1) / 2);
}

long long solution(vector<int> weights) {
    map<int, long long> m;
    long long answer = 0;
    
    for(int i = 0; i < weights.size(); i++) {
        m[weights[i]] += 1;
    }
    
    for(auto i = m.begin(); i != m.end(); i++) {
        int key = i -> first;
        long long value = i -> second;
        
        if(value >= 2) {
            answer += combination(value);
        }
        
        if(key % 2 == 0 && m[key / 2 * 3] != 0) {
            answer += value * m[key * 3 / 2];
        }
        
        if(key % 3 == 0 && m[key / 3 * 4] != 0) {
            answer += value * m[key * 4 / 3];
        }
        
        if(m[key * 2] != 0) {
            answer += value * m[key * 2];
        }
    }
    
    return answer;
}