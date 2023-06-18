import Foundation

// swift의 Array 타입은 Equtable 프로토콜을 채택하기 때문에 간편하게 풀 수 있음

func solution(_ want: [String], _ number: [Int], _ discount: [String]) -> Int {
    var indexDic: [String: Int] = [:]
    for i in 0..<want.count {
        indexDic[want[i]] = i
    }
    
    var answer: Int = 0
    for i in 0..<discount.count - 9 {
        var temp: [Int] = Array(repeating: 0, count: want.count)
        for j in i...i+9 {
            if let index = indexDic[discount[j]] {
                temp[index] += 1
            }
        }
        if temp == number {
            answer += 1
        }
    }
    
    return answer
}