import Foundation

// 처음 문제를 읽었을 때, d[i] = min(d[i/2], d[i - 1] + 1)이라는 점화식을 이용해서 풀수 있겠다.
// 라고 바로 생각했지만 n의 최대값이 10억이기 때문에 int 10억개면 512mb라는 훌쩍넘는 공간복잡도를 가지기
// 때문에 2로 나누어 떨어지지 않는 경우에는 + 1을 해주는 방식으로 문제를 해결했다.

func solution(_ n: Int) -> Int {
    var answer: Int = 0
    var temp: Int = n
    
    while true {
        if temp == 0 { break }
        if temp % 2 == 0 {
            temp /= 2
        } else {
            temp -= 1
            answer += 1
        }
    }

    return answer
}