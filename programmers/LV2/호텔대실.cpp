#include <algorithm>
#include <string>
#include <vector>

using namespace std;

vector<int> rooms(1440 + 2, 0);

void fill(int start, int end) {
    for(int i = start; i < end; i++) {
        rooms[i]++;
    }
}

int time2int(string s) {
    int hour = stoi(s.substr(0,2));
    int min = stoi(s.substr(3,2));
    
    return 60 * hour + min;
}

int solution(vector<vector<string>> book_time) {
    int answer = 0;
    
    for(int y = 0; y < book_time.size(); y++) {
        int start = time2int(book_time[y][0]);
        int end = time2int(book_time[y][1]) + 10;
        if(end > 1440) { end = 1439; }
        fill(start, end);
    }
    
    return *max_element(rooms.begin(), rooms.end());
}