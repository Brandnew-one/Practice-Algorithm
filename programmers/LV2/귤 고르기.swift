import Foundation

func solution(_ k: Int, _ tangerine: [Int]) -> Int {
    var orangeDic: [Int: Int] = [:]
    for t in tangerine {
        if let _ = orangeDic[t] {
            orangeDic[t]! += 1
        } else {
            orangeDic[t] = 1
        }
    }
    let counts = orangeDic.map { $1 }.sorted { $0 > $1 }
    var tempK: Int = k
    var answer: Int = 0
    
    for count in counts {
        if tempK <= 0 { break }
        answer += 1
        tempK -= count
    }
    
    return answer
}