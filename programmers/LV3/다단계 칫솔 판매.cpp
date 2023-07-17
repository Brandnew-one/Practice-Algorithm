#include <string>
#include <vector>
#include <map>

using namespace std;

map<string, string> p;
map<string, int> m;

void calculates(string seller, int money) {
    if(seller == "-") return;
    int profit = money * 0.1;
    m[seller] += money - profit; // center 고려
    
    if(profit > 0) calculates(p[seller], profit);
}

vector<int> solution(vector<string> enroll, vector<string> referral, vector<string> seller, vector<int> amount) {
    for(int i = 0; i < enroll.size(); i++) {
        p[enroll[i]] = referral[i];
        m[enroll[i]] = 0;
    }
    
    for(int i = 0; i < seller.size(); i++) {
        calculates(seller[i], amount[i] * 100);
    }
    
    vector<int> answer;
    for(int i = 0; i < enroll.size(); i++) {
        answer.push_back(m[enroll[i]]);
    }
    
    return answer;
}