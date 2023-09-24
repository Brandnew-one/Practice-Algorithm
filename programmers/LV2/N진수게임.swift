// MARK: - 체크할 숫자 범위에 따라서 시간초과 발생
func solution(_ n: Int, _ t: Int, _ m: Int, _ p: Int) -> String {
    let number = (0...m * t).reduce("") { $0 + String($1, radix: n) }
    let numberArr = number.map { String($0) }
    
    var answer = ""
    var index = 0
    
    while true {
        if answer.count >= t { break }
        answer += numberArr[m * index + p - 1]
        index += 1
    }
    
    return answer.uppercased()
}