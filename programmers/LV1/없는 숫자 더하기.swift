import Foundation

/// 개인적으로 아직 고차함수를 이용한 풀이에 아직 익숙하지 못하다고 느겼다.

func solution(_ numbers:[Int]) -> Int {
    var isExist: [Bool] = [Bool](repeating: false, count: 10)
    for number in numbers {
        isExist[number] = true
    }
    
    var answer: Int = 0
    for i in 0..<isExist.count {
        if !isExist[i] { answer += i }
    }
    
    return answer
}

/// 고차함수를 적용하면 아래와 같은 풀이를 적용할 수 있다.
/// 문제에서 numbers의 모든 원소가 다름이 보장되기 때문에 가능하다

func solution(_ numbers:[Int]) -> Int {
    return 45 - numbers.reduce(0, +)
}