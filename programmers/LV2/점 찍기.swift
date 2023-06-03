import Foundation

/// d^2 - k^2 >= boundary^2 으로 접근해야 시간 복잡도 해결할 수 있음

func findBoundary(_ k: Int, _ d: Int) -> Int {    
    let boundary = Int(sqrt(Double((d * d) - (k * k))))
    
    let power = (boundary * boundary) + (k * k)
    return sqrt(Double(power)) > Double(d) ? boundary - 1 : boundary
}

func countPoint(_ boundary: Int, _ k: Int) -> Int {
    (boundary - (boundary % k)) / k + 1
}

func solution(_ k: Int, _ d: Int) -> Int64 {
    var answer: Int64 = 0
    
    for i in stride(from: 0, through: d, by: k) {
        let boundary = findBoundary(i, d)
        answer += Int64(countPoint(boundary, k))
    }
    
    return answer
}