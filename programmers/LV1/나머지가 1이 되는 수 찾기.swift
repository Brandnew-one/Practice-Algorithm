import Foundation

// n = x * m + 1 -> n - 1 = x * m 으로 변형해서 접근

func solution(_ n: Int) -> Int {
    let refN = n - 1
    for i in 2...refN {
        if refN % i == 0 { return i}
    }
    return 0
}