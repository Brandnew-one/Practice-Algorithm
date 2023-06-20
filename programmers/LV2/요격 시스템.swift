import Foundation

// TODO: - 다시 풀어보기!

func solution(_ targets: [[Int]]) -> Int {
    let sortedTargets: [[Int]] = targets.sorted {
        if $0[1] == $1[1] {
            return $0[0] < $1[0]
        } else { 
            return $0[1] < $1[1]
        }
    }

    var answer: Int = 1
    var ref = sortedTargets[0][1]    
    
    for i in 1..<sortedTargets.count {
        if sortedTargets[i][0] >= ref {
            answer += 1
            ref = sortedTargets[i][1]
        }
    }
    
    return answer
}