import Foundation

func combination(_ n: Int) -> Int64 {
    return Int64(n * (n - 1) / 2)
}

func solution(_ weights: [Int]) -> Int64 {
    var answer: Int64 = 0
    
    var weightDic: [Int: Int] = [:]
    for weight in weights {
        if let _ = weightDic[weight] {
            weightDic[weight]! += 1
        } else {
            weightDic[weight] = 1
        }
    }
    
    for weight in weightDic {
        let currentValue = weight.value
        let currentKey = weight.key
        
        // 같은 몸무게가 2명 이상인 경우
        if currentValue >= 2 {
            answer += combination(currentValue)
        }
        
        // 2:3, 2:4, 3:4 비율을 만족하는 몸무게가 있는지?
        if let r1 = weightDic[Int(currentKey / 2) * 3] {
            if currentKey % 2 == 0 {
                answer += Int64(r1 * currentValue)
            }
        }
        
        if let r2 = weightDic[currentKey * 2] {
            answer += Int64(r2 * currentValue)
        }
        
        if let r3 = weightDic[Int(currentKey / 3) * 4] {
            if currentKey % 3 == 0 {
                answer += Int64(r3 * currentValue)
            }
        }
    }
    
    
    return answer
}