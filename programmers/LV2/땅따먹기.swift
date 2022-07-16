import Foundation

// 배열하나로 시간초과

func solution(_ land: [[Int]]) -> Int{
    var d: [[Int]] = [[Int]](repeating: Array(repeating: 0, count: 4), count: land.count)
    
    for i in 0..<4 {
        d[0][i] = land[0][i]
    }
    
    for i in 1..<land.count {
        for j in 0..<4 {
            var max: Int = 0
            for k in 0..<4 {
                if k == j { continue }
                if d[i - 1][k] >= max {
                    max = d[i - 1][k]
                }
            }
            d[i][j] = land[i][j] + max
        }
    }

    return d[land.count - 1].max()!
}

// 시간초과가 난 코드

func solution(_ land: [[Int]]) -> Int{
    var d: [[Int]] = [[Int]](repeating: Array(repeating: 0, count: 4), count: land.count)
    
    for i in 0..<4 {
        d[0][i] = land[0][i]
    }
    
    for i in 1..<land.count {
        for j in 0..<4 {
            var list: [Int] = []
            for k in 0..<4 {
                if k == j { continue }
                list.append(d[i - 1][k])
            }
            d[i][j] = land[i][j] + list.max()!
        }
    }

    return d[land.count - 1].max()!
}

// c++
#include <algorithm>
#include <iostream>
#include <vector>
using namespace std;

int d[100002][4];

int solution(vector<vector<int> > land) {
    for(int i = 0; i < 4; i++){ d[0][i] = land[0][i]; }
    for(int y = 1; y < land.size(); y++) {
        for(int x = 0; x < 4; x++) {
            vector<int> v;
            for(int k = 0; k < 4; k++) {
                if(k == x) { continue; }
                v.push_back(d[y - 1][k]);
            }
            d[y][x] = land[y][x] + *max_element(v.begin(), v.end());
        }
    }
    
    int max = 0;
    for(int i = 0; i < 4; i++) {
        if(d[land.size() - 1][i] >= max) {
            max = d[land.size() - 1][i];
        }
    }
    
    return max;
}