#include <string>
#include <vector>
#include <tuple>
#include <algorithm>

/*
swift로 먼저 풀면서 스택없으니까 불편하네라고 생각해놓고 정작 c++ 풀때 스택없이 풀었다.
*/

using namespace std;

typedef tuple<string, int, int> plan_type;

plan_type makePlanType(vector<string> plan) {
    int hour = stoi(plan[1].substr(0, 2)) * 60;
    int min = stoi(plan[1].substr(3, 2));
    int playtime = stoi(plan[2]);
    
    return plan_type(plan[0], hour + min, playtime);
}

bool cmp(plan_type a, plan_type b) {
    return get<1>(a) > get<1>(b);
}

vector<string> solution(vector<vector<string>> plans) {
    vector<plan_type> plan_vector;
    for(int i = 0; i < plans.size(); i++) {
        plan_vector.push_back(makePlanType(plans[i]));
    }
    sort(plan_vector.begin(), plan_vector.end(), cmp);

    vector<plan_type> suspend;
    vector<string> answer;
    plan_type onProgress = plan_vector.back();
    plan_vector.pop_back();
    
    while(!plan_vector.empty()) {
        plan_type todo = plan_vector.back();
        plan_vector.pop_back();
        
        if(get<1>(onProgress) + get<2>(onProgress) == get<1>(todo)) {
            answer.push_back(get<0>(onProgress));
            onProgress = todo;
        } else if(get<1>(onProgress) + get<2>(onProgress) < get<1>(todo)) {
            if(suspend.empty()) {
                answer.push_back(get<0>(onProgress));
                onProgress = todo;
            } else {
                answer.push_back(get<0>(onProgress));
                plan_type sus = suspend.back();
                suspend.pop_back();
                
                get<1>(sus) = get<1>(onProgress) + get<2>(onProgress);
                onProgress = sus;
                plan_vector.push_back(todo);
            }
        } else {
            get<2>(onProgress) = get<1>(onProgress) + get<2>(onProgress) - get<1>(todo);
            suspend.push_back(onProgress);
            onProgress = todo;
        }
    }
    answer.push_back(get<0>(onProgress));
    while(!suspend.empty()) {
        answer.push_back(get<0>(suspend.back()));
        suspend.pop_back();
    }
    
    return answer;
}