import Foundation

func trapezoid(_ lower: Int, _ upper: Int) -> Double {
    return Double(lower + upper) / 2
}

func calculate(_ k: Int) -> Int {
    return k % 2 == 0 ? k / 2 : k * 3 + 1
}

func solution(_ k: Int, _ ranges: [[Int]]) -> [Double] {
    var tempK: Int = k
    var answer: [Double] = []
    var sequence: [Int] = [k]
    
    while tempK != 1 {
        tempK = calculate(tempK)
        sequence.append(tempK)
    }
    
    for range in ranges {
        let first = range[0]
        let second = sequence.count - 1 + range[1]
        
        if first > second {
            answer.append(-1.0)
        } else if first == second {
            answer.append(0.0)
        } else {
            var sum: Double = 0.0
            for i in first..<second {
                sum += trapezoid(sequence[i], sequence[i + 1])
            }
            answer.append(sum)
        }
    }
    
    return answer
}