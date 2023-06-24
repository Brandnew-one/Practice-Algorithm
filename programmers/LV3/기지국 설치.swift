import Foundation

/*
N = 2 * 10^8으로 O(N)으로 풀이가 가능하겠다 싶었는데 시간초과가 발생했다.
조금만 더 생각해보면 stations 기준만으로도 동일한 연산을 할 수 있다.
*/

typealias Position = (start: Int, end: Int)

func solution(_ n: Int, _ stations: [Int], _ w: Int) -> Int {
    var unvis: [Position] = []
    
    if stations[0] - w > 1 {
        unvis.append((1, stations[0] - w - 1))
    }
    for i in 0..<stations.count - 1 {
        let left = stations[i] + w
        let right = stations[i + 1] - w
        
        if right > left {
            unvis.append((left + 1, right - 1))
        }
    }
    if stations.last! + w < n {
        unvis.append((stations.last! + w + 1, n))
    }
    
    var answer = 0
    for vis in unvis {
        answer += (vis.end - vis.start + 1) / (2 * w + 1)
        if (vis.end - vis.start + 1) % (2 * w + 1) != 0 { answer += 1 }
    }
    
    return answer
}

// MARK: - 시간초과 풀이
/* 
func fill(_ vis: inout [Bool], _ station: Int, _ w: Int) {
    let start = station - w > 1 ? station - w : 1
    let end = station + w < vis.count - 1 ? station + w : vis.count - 1
    for i in start...end {
        vis[i] = true
    }
}

func solution(_ n: Int, _ stations: [Int], _ w: Int) -> Int {
    var vis: [Bool] = Array(repeating: false, count: n + 1)
    
    for station in stations {
        fill(&vis, station, w)
    }
    
    var answer = 0
    var cnt = 0
    for i in 1...n {
        if vis[i] {
            if cnt == 0 { continue }
            answer += cnt / (2 * w + 1)
            if cnt % (2 * w + 1) != 0 { answer += 1 }
            cnt = 0
        } else {
            cnt += 1
        }
    }
    
    if cnt != 0 {
        answer += cnt / (2 * w + 1)
        if cnt % (2 * w + 1) != 0 { answer += 1 }
    }
    
    return answer
}
*/