#include <algorithm>
#include <string>
#include <vector>

using namespace std;

long long d1[500002]; // 1
long long d2[500002]; // -1

long long solution(vector<int> sequence) {
    d1[0] = sequence[0];
    bool sign = false;
    for(int i = 1; i < sequence.size(); i++) {
        if(sign) {
            d1[i] = max((long long)(d1[i - 1] + sequence[i]), (long long)sequence[i]);
        } else {
            d1[i] = max((long long)(d1[i - 1] + sequence[i] * -1), (long long)sequence[i] * -1);
        }
        sign = !sign;
    }
    
    d2[0] = -1 * sequence[0];
    sign = true;
    for(int i = 1; i < sequence.size(); i++) {
        if(sign) {
            d2[i] = max((long long)(d2[i - 1] + sequence[i]), (long long)sequence[i]);
        } else {
            d2[i] = max((long long)(d2[i - 1] + sequence[i] * -1), (long long)sequence[i] * -1);
        }
        sign = !sign;
    }
    
    long long answer = 0;
    for(int i = 0; i < sequence.size(); i++) {
        answer = max({answer, d1[i], d2[i]});
    }
    return answer;
}