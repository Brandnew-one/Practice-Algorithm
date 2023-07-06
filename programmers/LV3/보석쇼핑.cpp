


// 틀렸습니다. -> 아직 어떤 엣지 케이스 때문에 틀리고 있는지 파악 못함
// [처음, 끝]의 범위는 모든 보석을 포함하는것이 자명하기 때문에 모든 보석을 가진 상태로 인덱스를 줄여가면서 최소 범위를 찾자
// start -> / <- end 2 case의 결과값이 다를 수 있기 때문에 두번의 탐색 필요

/*
#include <string>
#include <vector>
#include <map>

using namespace std;

map<string, int> m;
vector<string> gem;

bool check(int start, int end, bool dir) {
    if(start > end) return 0;
    
    if(dir) m[gem[end + 1]] -= 1;
    else m[gem[start - 1]] -= 1;
    
    for(auto it = m.begin(); it != m.end(); it++) {
        if(it->second <= 0) {
            if(dir) m[gem[end + 1]] += 1;
            else m[gem[start - 1]] += 1;
            return 0;
        }
    }
    
    return 1;
}


vector<int> solution(vector<string> gems) {
    gem = gems;
    for(int i = 0; i < gems.size(); i++) {
        m[gems[i]] += 1;
    }
    map<string, int> temp = m;
    
    int start = 0, r_start = 0;
    int end = gems.size() - 1 , r_end = gems.size() - 1;
    
    while(true) {
        if(check(start, end - 1, 1)) end--;
        else if(check(start + 1, end, 0)) start++;
        else break;
    }
    
    m = temp;
    while(true) {
        if(check(r_start + 1, r_end, 0)) r_start++;
        else if(check(r_start, r_end - 1, 1)) r_end--;
        else break;
    }
    
    vector<int> answer;
    if(r_end - r_start >= end - start) {
        answer.push_back(start + 1);
        answer.push_back(end + 1);
    } else {
        answer.push_back(r_start + 1);
        answer.push_back(r_end + 1);
    }
    
    return answer;
}
*/

// vector<int> solution(vector<string> gems) {
//     for(int i = 0; i < gems.size(); i++) {
//         m[gems[i]] += 1;
//     }
    
//     int start = 0, end = 0;
//     int astart = 0, aend = 0;
//     int cnt = m.size();
//     map<string, int> temp;
    
//     while(true) {
//         if(temp.size() == cnt) break;
//         temp[gems[end++]] += 1;
//     }
//     astart = start;
//     aend = end;
//     int min = end - start;
    
//     while(true) {
//         if(temp.size() == cnt) {
//             if(end - start < min) {
//                 astart = start;
//                 aend = end;
//             }
//             if(temp[gems[start]] > 1) temp[gems[start]] -= 1;
//             else temp.erase(gems[start]);
//             start++;
//         } else if(end == gems.size()) break;
//         else {
//             temp[gems[end++]] += 1;
//         }
//     }
    
    
//     vector<int> answer;
//     answer.push_back(astart + 1);
//     answer.push_back(aend);
    
//     return answer;
// }


// MARK: - 참고 코드(TC에서 틀리는게 있는데 통과됨)

// vector<int> solution(vector<string> gems) {
//     vector<int> answer = {1, (int)gems.size()}; // 인덱스를 직접 참조하여 값을 수정하기 위해 초기값을 설정  
//     int s = 0; //start 
//     int e = 0; //end
//     int distance = gems.size()-1; // end-start의 값으로 가장 작은 구간을 구하기 위한 변수
//     map<string, int> m;
//     int total;
//     for(string i : gems) {
//         m[i] += 1;
//     }
    
//     total = m.size(); // 보석의 갯수를 구한 뒤
//     m.clear(); // 맵 초기화
    
//     while(true) {
//         if(m.size() == total) { // 모든 보석을 다 구한 경우
//             if(e-s<distance) { // end-start(현재구간)과 distance(미리 구해놨던 최단구간)를 비교
//                 distance = e-s;
//                 answer[0] = s+1;
//                 answer[1] = e;
//             }
            
//             if(m[gems[s]] == 1) { // 보석의 갯수가 1개 일 때
//                 m.erase(gems[s]);
//                 s++; // m[gems[s]]가 1일때 --을 하면 맵에서 사라지지 않고 value가 0이 되기 때문
//             }
//             else { // 보석의 갯수가 1개 이상일 때
//                 m[gems[s]]--;
//                 s++;
//             }
//         }
//         else if(e == gems.size()) // 끝까지 탐색을 마쳤을때
//             break;
        
//         else { // 모든 보석을 아직 찾지 못했을 경우
//                 m[gems[e]]++;
//                 e++; // end값을 증가시키면서 gems[e]에 해당하는 보석의 갯수 증가
//         }
        
//     }
    
//     return answer;
// }