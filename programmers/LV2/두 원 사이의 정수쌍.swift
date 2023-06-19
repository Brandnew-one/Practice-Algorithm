import Foundation

func minmaxY(_ r1: Int, _ r2: Int, _ x: Int) -> Int64 {
    var min: Int64 = 0
    if x < r1 {
        let minDouble: Double = sqrt(Double(r1 * r1) - Double(x * x)) 
        min = Double(Int64(minDouble)) == minDouble ? Int64(minDouble) : Int64(minDouble) + 1
    }

    let maxDouble: Double = sqrt(Double(r2 * r2) - Double(x * x)) 
    let max = Int64(maxDouble)
    
    return max - min + 1
}

func solution(_ r1: Int, _ r2: Int) -> Int64 {
    var answer: Int64 = 0
    
    for i in 0...r2 {
        answer += minmaxY(r1, r2, i)
    }
    answer *= 4
    answer -= minmaxY(r1, r2, 0) * 4
    
    return answer
}