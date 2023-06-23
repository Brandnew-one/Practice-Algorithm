import Foundation

func solution(_ a: [Int], _ b: [Int]) -> Int {
    var sortedA = a.sorted { $0 < $1 }
    var sortedB = b.sorted { $0 > $1 }
    var answer: Int = 0
    
    for va in sortedA {
        var vb: Int
        while true {
            if sortedB.isEmpty { return answer }
            vb = sortedB.removeLast()
            if vb > va { break }
        }
        answer += 1
    }
    return answer
}