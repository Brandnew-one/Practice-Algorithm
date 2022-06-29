import Foundation

// 문제 조건이 조금 이상하다. n편중, h번 이상 인용된 논문이 h편 이상이고 나머지 논문이 h번 "이하" 인용되었다면
// 이하라는 조건이 붙으면 h이상인 논문이 h편 이상이기만 하면 무조건 성립하는게 아닌가?
// O(10^3 * 10^4)

func check(_ citations: [Int], _ ref: Int) -> Bool {
    var count: Int = 0
    for item in citations {
        if item >= ref {
            count += 1
        }
    }
    return count >= ref
}

func solution(_ citations: [Int]) -> Int {
    let arr = citations.sorted { $0 > $1 }
    var ref = arr[0]
    while true {
        if check(arr, ref) {
            return ref
        }
        ref -= 1
    }
    return 0
}