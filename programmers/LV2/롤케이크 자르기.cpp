#include <string>
#include <vector>
#include <map>

using namespace std;

int solution(vector<int> topping) {
    int answer = 0;
    map<int, int> m1;
    map<int, int> m2;
    
    for(int i = 0; i < topping.size(); i++) {
        m1[topping[i]] += 1;
    }
    
    for(int i = 0; i < topping.size(); i++) {
        int current = topping[i];
        m1[current] -= 1;
        m2[current] += 1;
        
        if(m1[current] == 0) {
            m1.erase(current);
        }
        
        if(m1.size() == m2.size()) {
            answer += 1;
        }
    }
    
    return answer;
}