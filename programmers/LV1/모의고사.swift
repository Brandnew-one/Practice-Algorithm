import Foundation

/// 단순히 비교를 통해서 정답 수를 Count를 해주면 된다.
/// 정답의 개수가 같은 경우 오름차순 정렬을 {1, 1.score} 이런식으로 딕셔너리로 만드는 아이디어도 좋아보인다.

func solution(_ answers:[Int]) -> [Int] {
    let a = [1, 2, 3, 4, 5]
    let b = [2, 1, 2, 3, 2, 4, 2, 5]
    let c = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var scores: [Int] = [0, 0, 0]
    for i in 0..<answers.count {
        let answer = answers[i]
        if a[i % a.count] == answer { scores[0] += 1 }
        if b[i % b.count] == answer { scores[1] += 1 }
        if c[i % c.count] == answer { scores[2] += 1 }
    }
    let max: Int = scores.max()!
    var answer: [Int] = []
    for i in 0..<scores.count {
        if scores[i] == max {
            answer.append(i + 1)
        }
    }
    
    return answer
}