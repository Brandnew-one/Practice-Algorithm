import Foundation

/// 백트랙킹
/// 처음에 간단하게 Min{(10 - digitNumber), digitnumber}를 활용해서 풀었으나 예외가 너무 많음
/// 각 자리수를 +n 을 통해 숫자를 변경할 것인지? 아닌지를 기준으로 2^8 개의 경우의 수 모두 관찰

var answer: Int = Int.max
var count: Int = 0

func dfs(_ digit: Int, _ storey: Int, _ tempSum: Int) {
    if digit == count { 
        let tempAnswer = tempSum + countStorey(storey)
        if answer >= tempAnswer {
            answer = tempAnswer
        }
        return 
    }
    
    let storeyArr: [Int] = String(storey).map { Int(String($0))! }.reversed()
    let s = (10 - storeyArr[digit])
    var t = 1
    
    for _ in 0..<digit {
        t *= 10
    }
    
    dfs(digit + 1, storey, tempSum)
    dfs(digit + 1, storey + (t * s), tempSum + s)
}

func countStorey(_ storey: Int) -> Int {
    String(storey).map { Int(String($0))! }.reduce(0, +)
}

func solution(_ storey: Int) -> Int {
    count = String(storey).count
    dfs(0, storey, 0)
    
    return answer
}