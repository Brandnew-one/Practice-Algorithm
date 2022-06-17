import Foundation

/// stages에 올 수 있는 값이 N + 1 까지라는 조건을 무시하고 풀다가 시간을 조금 소비했다.
/// 각 stage에 도전했던 사용자들과 각 stage에 머무르고 있는 사람들을 구해 이를 나눠주면 쉽게 구할 수 있다.

func solution(_ N: Int, _ stages: [Int]) -> [Int] {
    var total: [Int] = [Int](repeating: 0, count: N + 1) // 각 stage 도전한 사용자
    var fail: [Int] = [Int](repeating: 0, count: N + 1) // 각 stage에 머무르는 사용자
    for stage in stages {
        fail[stage - 1] += 1
        for i in 0..<stage {
            total[i] += 1
        }
    }
    var dic: [Int: Double] = [:]
    for i in 0..<N {
        if total[i] == 0 {
            dic[i + 1] = 0.0
        } else {
            dic[i + 1] = Double(fail[i]) / Double(total[i])
            // print(dic[i + 1])
        }
    }
    
    var answer: [Int] = []
    let sortDic = dic.sorted { 
        if $0.1 < $1.1 {
            return false
        } else if $0.1 == $1.1 {
            return $0.0 < $1.0
        } else {
            return true
        }
    }
    for i in 0..<sortDic.count {
        answer.append(sortDic[i].key)
    }
    
    return answer
}