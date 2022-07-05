import Foundation

// 문제 자체는 굉장히 단순하다. 하지만 2차원 배열을 실제로 만들게 되면 10^14으로 512MB가 훌쩍 넘어가 공간복잡도를 고려해야한다
// 처음 풀때는 각 Row를 직접 만들어서 문제의 조건에 해당하는 범위만 answer에 append하는 식으로 구현했다.
// 하지만 각 Row를 만들 수 있는 시점에서 index만 알아도 해당 index의 값을 추출할 수 있기 때문에 아래의 풀이처럼 보다 간단하게 
// 풀이가 가능하다!!

// MARK: - 초기 풀이
func makeRow(_ n: Int, _ d: Int) -> [Int] {
    var answer: [Int] = []
    for i in 0...d {
        answer.append(d + 1)
    }
    for i in d + 1..<n {
        answer.append(Int(i) + 1)
    }
    return answer
}

func solution(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
    var answer: [Int] = []
    
    let firstDiv = Int(left / Int64(n))
    let lastDiv = Int(right / Int64(n))
    
    if firstDiv != lastDiv {
         // Start
        var div = Int(left / Int64(n))
        var remindar = Int(left % Int64(n))
        var row = makeRow(n, div)
        for i in remindar..<n {
            answer.append(row[i])
        }
        div += 1
        while true {
            if div >= lastDiv { break }
            row = makeRow(n, div)
            row.forEach {
                answer.append($0)
            }
            div += 1
        }

        // end
        div = Int(right / Int64(n))
        remindar = Int(right % Int64(n))
        row = makeRow(n, div)
        for i in 0...remindar {
            answer.append(row[i])
        }
    } else {
        var div = Int(left / Int64(n))
        var remindarL = Int(left % Int64(n))
        var remindarR = Int(right % Int64(n))
        var row = makeRow(n, div)
        for i in remindarL...remindarR {
            answer.append(row[i])
        }
    }
    
    return answer
}

// MARK: - 풀이개선
func solution(_ n: Int, _ left: Int64, _ right: Int64) -> [Int] {
    return (left...right).map { max(Int($0 / Int64(n)), Int($0 % Int64(n))) + 1 }
}