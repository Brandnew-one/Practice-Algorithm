import Foundation

/// 도둑맞은 체육복을 고려해서 각 인덱스 학생이 가진 체육복을 먼저 계산
/// [2, 0, 2, 0, 1], [1, 0, 2, 0, 2] case를 고려해보면 체육복의 수가 0인 학생을 만나는 경우 한쪽 방향에서만 가져오면 예외 존재
/// 0인 학생을 만나면 왼쪽 학생에게 여유분이 있으면 그걸 받고 그게 아니라면 오른쪽 학생에 받도록 설정

let dx: [Int] = [-1, 1]

func solution(_ n: Int, _ lost: [Int], _ reserve: [Int]) -> Int {
    var clothes: [Int] = [Int](repeating: 1, count: n)
    for item in lost {
        clothes[item - 1] -= 1
    }
    for item in reserve {
        clothes[item - 1] += 1
    }
    
    for i in 0..<clothes.count {
        if clothes[i] == 0 {
            for item in dx {
                let nx = i + item
                if nx < 0 || nx >= clothes.count { continue }
                if clothes[nx] >= 2 {
                    clothes[nx] -= 1
                    clothes[i] = 1
                    break
                }
            }
        }
    }

    var answer = 0
    for item in clothes {
        if item == 0 { answer += 1 }
    }
    
    return clothes.count - answer
}