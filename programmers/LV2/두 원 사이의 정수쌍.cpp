#include <string>
#include <vector>
#include <cmath>

using namespace std;

// c++ 문제 풀때 단순곱에서 overflow 발생하는 case 조심하기!
long long minmaxY(long long r1, long long r2, long long x) {
    long long min = 0, max = 0;
    
    if(x < r1) {
        double minDouble = sqrt((double)(r1 * r1 - x * x));
        long long minLong = (long long)minDouble;
        min = (double)minLong == minDouble ? minLong : minLong + 1;
    }
    
    double maxDouble = sqrt((double)(r2 * r2 - x * x));
    max = (long long)maxDouble;
    
    return max - min + 1;
}

long long solution(int r1, int r2) {
    long long answer = 0;
    
    for(int i = 0; i <= r2; i++) {
        answer += minmaxY(r1, r2, i);
    }
    answer *= 4;
    answer -= minmaxY(r1, r2, 0) * 4;
    
    return answer;
}