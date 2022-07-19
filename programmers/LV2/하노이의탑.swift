import Foundation

// 재귀하면 항상 처음 나오던 하노이탑 문제 -> 날잡고 예제들을 다시 풀어봐야겠다.
// 재귀는 탈출조건과 조건식이 감소하는 방향으로!

var answer: [[Int]] = []

func move(_ n: Int, _ from: Int, _ by: Int, _ to: Int) {
    if n == 1 {
        answer.append([from, to])
        return
    }
    move(n - 1, from, to, by)
    answer.append([from, to])
    move(n - 1, by, from, to)
}

func solution(_ n: Int) -> [[Int]] {
    move(n, 1, 2, 3)
    return answer
}