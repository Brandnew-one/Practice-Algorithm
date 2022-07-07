import Foundation

// 전형적인 dp 문제였다. 문제를 읽어보면 피보나치를 수열의 n번째 값을 구하는 것임을 알 수 있다
// 처음에 n = 1인 case를 고려하지 않아 오답이 났었다 ㅠ

func solution(_ n: Int) -> Int {
    var d: [Int] = [Int](repeating: 0, count: n + 2) // n = 1 고려
    d[1] = 1
    d[2] = 2
    if n < 3 {
        return d[n]
    }
    for i in 3...n {
        d[i] = (d[i - 1] + d[i - 2]) % 1234567
    }
    
    return d[n]
}