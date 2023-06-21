import Foundation

// 시간 초과 코드
/*
func check(_ s: String) -> Bool {
    let sArr: [String] = s.map { String($0) }
    let refIndex = sArr.count / 2
    for i in 0...refIndex {
        if sArr[i] != sArr[sArr.count - 1 - i] {
            return false
        }
    }
    return true
}

func solution(_ s: String) -> Int {
    let sArr: [String] = s.map { String($0) }
    for i in stride(from: sArr.count - 1, to: 1, by: -1) {
        for j in 0..<sArr.count {
            if j + i >= sArr.count { break }
            var temp: String = ""
            for k in j...i + j {
                temp += sArr[k]
            }
            if check(temp) {
                return i + 1
            }
        }
    }

    return 1
}
*/

import Foundation

func solution(_ s: String) -> Int {
    let sArr: [String] = s.map { String($0) }
    var answer: Int = 1
    var d: [[Bool]] = Array(
        repeating: Array(repeating: false, count: s.count),
        count: s.count
    )
    
    if s.count < 2 { return answer }
    
    // 초기값 설정
    for i in 0..<s.count - 1 {
        d[i][i] = true
    }
    for i in 0..<s.count - 2 {
        if sArr[i] == sArr[i + 1] {
            d[i][i + 1] = true
            answer = 2
        }
    }
    
    if s.count < 3 { return answer }
    for k in 3...s.count {
        for i in 0...s.count - k {
            let index = i + k - 1
            if sArr[i] == sArr[index] && d[i + 1][index - 1] {
                d[i][index] = true
                answer = k                
            }
        }
    }

    return answer
}