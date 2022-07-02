import Foundation

// 1) dungeons의 세로(행) 길이(즉, 던전의 개수)는 1 이상 8 이하입니다.
// 1)의 조건을 보면 O(8! * 8)의 시간복잡도로 해결할 수 있는 문제이다.
// 사실 처음에는 규칙을 찾아보려고 시도하다가 실패했고, 모든 case를 관찰해도 시간초과가 발생하지 않을것이라는것을 확인하고 풀었다.

var answer: Int = 0

func check(_ k: Int, _ dungeons: [[Int]]) {
    var k = k
    var result = 0
    for item in dungeons {
        if k >= item[0] {
            k -= item[1]
            result += 1
        } else {
            continue
        }
    }
    if result >= answer {
        answer = result
    }
}

func permutation(_ k: Int, _ n: Int, _ dungeons: [[Int]]) {
    if n == 0 {
        check(k, dungeons)
    } else {
        var dungeon = dungeons
        permutation(k, n - 1, dungeon)
        for i in 0..<n {
            dungeon.swapAt(i, n)
            permutation(k, n - 1, dungeon)
            dungeon.swapAt(i, n)
        }
    }
}

func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
    permutation(k, dungeons.count - 1, dungeons)
    return answer
}