import Foundation

var answer: Int = 0

// 올바른 괄호 문자열임을 판단한는 로직
func check(_ s: String) {
    var temp: [Character] = []
    for c in s {
        if c == "[" || c == "{" || c == "(" {
            temp.append(c)
        } else if c == "]" {
            if let last = temp.last {
                if last == "[" {
                    temp.removeLast()
                } else {
                    return
                }
            } else {
                return
            }
        } else if c == "}" {
            if let last = temp.last {
                if last == "{" {
                    temp.removeLast()
                } else {
                    return
                }
            } else {
                return
            }
        } else {
            if let last = temp.last {
                if last == "(" {
                    temp.removeLast()
                } else {
                    return
                }
            } else {
                return
            }
        }
    }
    if temp.isEmpty {
        answer += 1
    }
}

func solution(_ s: String) -> Int {
    let sArray = s.map { String($0) }
    for i in 0..<sArray.count {
        var temp: String = ""
        for j in i..<sArray.count {
            temp += sArray[j]
        }
        for k in 0..<i {
            temp += sArray[k]
        }
        check(temp)
    }
    return answer
}