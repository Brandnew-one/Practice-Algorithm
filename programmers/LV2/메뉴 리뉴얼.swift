import Foundation

var dic: [String: Int] = [:]

func combination(_ array: [String], _ n: Int) {
    func cycle(_ index: Int, _ now: [String]) {
        if now.count == n {
            let com = now.reduce("") { $0 + $1 }
            if dic[com] == nil {
                dic[com] = 1
            } else {
                dic[com]! += 1
            }
            return
        }
        for i in index..<array.count {
            cycle(i + 1, now + [array[i]])
        }
    }
    cycle(0, [])
}

func solution(_ orders: [String], _ course: [Int]) -> [String] {
    for order in orders {
        let arr = order.map { String($0) }.sorted { $0 < $1 }
        if arr.count < 2 { continue }
        for i in 2...arr.count {
            combination(arr, i)
        }
    }
    let sortedDic = dic.sorted { $0.key < $1.key }
    var answer: [String] = []
    
    for cnt in course {
        var temp: [String: Int] = [:]
        for (key, value) in sortedDic {
            if key.count == cnt {
                temp[key] = value
            }
        }
        let sortedTemp = temp.sorted { $0.value > $1.value }
        if !sortedTemp.isEmpty {
            let max = sortedTemp.first!.value
            if max > 1 {
                for element in sortedTemp {
                    if element.value < max { break }
                    answer.append(element.key)
                }
            }
        }
    }
    if answer.isEmpty { 
        return [] 
    } else {
        return answer.sorted { $0 < $1 }
    }
}