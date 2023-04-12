import Foundation

func solution(
    _ name: [String], 
    _ yearning: [Int], 
    _ photo: [[String]]
) -> [Int] {
    var score: [String: Int] = [:]
    var answer: [Int] = []

    for i in 0..<name.count {
        score[name[i]] = yearning[i]
    }    
    for i in 0..<photo.count {
        var sum: Int = 0
        for p in photo[i] {
            if let s = score[p] {
                sum += s
            }
        }
        answer.append(sum)
    }
    return answer
}