#include <algorithm>
#include <string>
#include <vector>
#include <iostream>

using namespace std;

int c = 0;

bool compare(vector<int> a, vector<int> b) {
    if(a[c] == b[c]) {
        return a[0] > b[0];
    } else {
        return a[c] < b[c];
    }
}

int solution(vector<vector<int>> data, int col, int row_begin, int row_end) {
    int answer = 0;
    c = col - 1;
    sort(data.begin(), data.end(), compare);
    
    vector<int> mod_temp;
    for(int i = row_begin; i <= row_end; i++) {
        int sum_temp = 0;
        for(int j = 0; j < data[0].size(); j++) {
            sum_temp += data[i - 1][j] % i;
        }
        mod_temp.push_back(sum_temp);
    }
    
    answer = mod_temp[0];
    for(int i = 1; i < mod_temp.size(); i++) {
        answer ^= mod_temp[i];
    }
    
    return answer;
}