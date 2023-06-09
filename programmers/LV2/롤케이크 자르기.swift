import Foundation

/// N <= 10^6 조건이 있기 때문에 O(N^2) 풀이를 피하고자 했는데 생각치 못한곳에서 시간 초과가 발생했다.
/// d[i] = Topping(f: prevF, s: prevS)에서 (Dictionary, Dictionary)을 생성하는데 O(N)의 시간복잡도가 발생한다.

typealias Topping = (f: [Int: Int], s: [Int: Int])

func solution(_ topping: [Int]) -> Int {
    var initalValueF: [Int: Int] = [:]
    var initalValueS: [Int: Int] = [:]

    initalValueF[topping[0]] = 1

    for i in 1..<topping.count {
        let t = topping[i]
        if let _ = initalValueS[t] {
            initalValueS[t]! += 1
        } else {
            initalValueS[t] = 1
        }
    }

    var d: Topping = Topping(f: initalValueF, s: initalValueS)

    var answer: Int = 0
    for i in 1..<topping.count {
        let currentTopping = topping[i]

        if let _ = d.f[currentTopping] {
            d.f[currentTopping]! += 1
        } else {
            d.f[currentTopping] = 1
        }

        if let s = d.s[currentTopping] {
            if s > 1 {
                d.s[currentTopping]! -= 1
            } else {
                d.s[currentTopping] = nil
            }
        }

        if d.f.count == d.s.count {
            answer += 1
        }
    }

    return answer
}

/*
/// 시간 초과 풀이

typealias Topping = (f: [Int: Int], s: [Int: Int])

func solution(_ topping: [Int]) -> Int {
    // 초기값 세팅
    var d: [Topping] = Array(repeating: ([:], [:]), count: topping.count)
    var initalValueF: [Int: Int] = [:]
    var initalValueS: [Int: Int] = [:]
    
    initalValueF[topping[0]] = 1
    
    for i in 1..<topping.count {
        let t = topping[i]
        if let _ = initalValueS[t] {
            initalValueS[t]! += 1
        } else {
            initalValueS[t] = 1
        }
    }
    
    d[0] = Topping(f: initalValueF, s: initalValueS)
    
    for i in 1..<topping.count {
        let currentTopping = topping[i]
        var prevF = d[i - 1].f
        var prevS = d[i - 1].s
        
        if let _ = prevF[currentTopping] {
            prevF[currentTopping]! += 1
        } else {
            prevF[currentTopping] = 1
        }
        
        if let s = prevS[currentTopping] {
            if s > 1 {
                prevS[currentTopping]! -= 1
            } else {
                prevS[currentTopping] = nil
            }
        }
        
        d[i] = Topping(f: prevF, s: prevS)
    }
    
    var answer: Int = 0
    for i in 0..<topping.count {
        if d[i].f.count == d[i].s.count {
            answer += 1
        }
    }
    
    return answer
}
*/