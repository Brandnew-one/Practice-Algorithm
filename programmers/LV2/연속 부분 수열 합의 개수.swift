import Foundation

func solution(_ elements: [Int]) -> Int {
    var answer = Set<Int>()
    let cnt = elements.count

    for c in 1...cnt {
        for i in 0..<cnt {
            var temp = 0
            for j in 1...c {
                temp += elements[(i + j) % cnt]
            }
            answer.insert(temp)
        }
    }
    
    return answer.count
}