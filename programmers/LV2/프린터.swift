import Foundation

// 큐를 이용하면 좀더 깔끔하게 풀 수 있을것 같다. 하지만 문제에서 주어진 조건이 대기목록이 최대 100이므로 O(N^2)으로도 충분히 풀이가 가능하다
// 당연하게도 Array 이기 때문에 removeFirst 의 시간복잡도는 O(N)이다!

typealias Printer = (Int, Int) // location, priority

func check(_ printer: [Printer]) -> Bool {
    if printer.count < 1 { return false }
    let priority = printer[0].1
    for i in 1..<printer.count {
        if printer[i].1 > priority {
            return true
        }
    }
    return false
}

func solution(_ priorities: [Int], _ location: Int) -> Int {
    var answerArr = [Int](repeating: 0, count: priorities.count)
    var printer: [Printer] = []
    for i in 0..<priorities.count {
        printer.append((i, priorities[i]))
    }
    var number = 1
    while !printer.isEmpty {
        let first = printer[0]
        if check(printer) {
            printer.removeFirst()
            printer.append(first)
        } else {
            answerArr[first.0] = number
            printer.removeFirst()
            number += 1
        }
    }
    
    return answerArr[location]
}