import Foundation

/// 문제를 처음 읽었을 때 백트랙킹으로 모든 case를 돌아야 하나 생각했지만 d가 100이므로 시간 초과
/// 정렬 후 낮은것 부터 담으면 최대 개수가 보장되기 때문에 굳이 백트랙킹을 선택할 필요가 없다

func solution(_ d: [Int], _ budget: Int) -> Int {
    var sortArr = d.sorted { $0 < $1 }
    var temp = budget
    var answer = 0
    
    for num in sortArr {
        if temp >= num {
            answer += 1
            temp -= num
        }
    }
    
    return answer
}