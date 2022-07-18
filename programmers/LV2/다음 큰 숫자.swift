import Foundation

// 정말 단순하게 n 보다 큰 숫자를 하나하나 검사하면서 조건을 만족하면 return 하도록 구현했다.
// 규칙을 발견하면 시간복잡도를 줄일 수 있을것 같은데 다른 풀이들 화인 필요

var refCount: Int = 0

func compare(_ n: Int) -> Bool {
    let binary = String(n, radix: 2).map { $0 }
    var count: Int = 0
    binary.forEach {
        if $0 == "1" {
            count += 1
        }
    }
    return refCount == count
}

func solution(_ n: Int) -> Int {
    let binary = String(n, radix: 2).map { $0 }
    binary.forEach {
        if $0 == "1" {
            refCount += 1
        }
    }
    var number = n + 1
    while true {
        if compare(number) {
            return number
        } else {
            number += 1
        }
    }
}