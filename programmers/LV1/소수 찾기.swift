import Foundation

// 1 ~ n 까지에 존재하는 소수의 개수를 구해야 하기 때문에 하나하나 모든 수를 소수 판별하기 보다는 에라토스테네스의 체 사용!
// O(NloglogN) 

func solution(_ n: Int) -> Int {
    var arr = [Bool](repeating: true, count: n + 1)
    var answer: Int = 0
    arr[1] = false
    arr[2] = true
    
    for num in 2...n {
        if arr[num] { 
            answer += 1
            for index in stride(from: num * 2, through: n, by: num) {
                arr[index] = false
            }
        }
    }   
    return answer
}
