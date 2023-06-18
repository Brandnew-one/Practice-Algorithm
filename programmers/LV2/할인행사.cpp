#include <string>
#include <vector>
#include <map>

// 1) c++ map은 트리형태로 구현되어 있고, swift에서 사용하던 딕셔너리와는 다르다.
// 2) map에서 저장되지 않은 키값에 접근하는 경우 임의로 값을 생성할 수 있기 때문에 find 메서드를 사용해야 한다

using namespace std;

bool compare(vector<int> v1, vector<int> v2) {
    if(v1.size() == v2.size()) {
        for(int i = 0; i < v1.size(); i++) {
            if(v1[i] != v2[i]) return false;
        }
    } else {
        return false;
    }
    return true;
}

int solution(vector<string> want, vector<int> number, vector<string> discount) {
    map<string, int> indexMap;
    for(int i = 0; i < want.size(); i++) {
        indexMap[want[i]] = i;
    }
    
    int answer = 0;
    for(int i = 0; i < discount.size() - 9; i++) {
        vector<int> temp;
        temp.assign(number.size(), 0);
        
        for(int j = i; j < i + 10; j++) {
            if(indexMap.find(discount[j]) != indexMap.end()) {
                temp[indexMap[discount[j]]]++;
            }
        }        
        if(compare(number, temp)) answer++;
    }
    
    return answer;
}