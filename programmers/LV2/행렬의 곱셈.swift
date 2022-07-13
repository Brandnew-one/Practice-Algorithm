import Foundation

// 사실 구현 자체는 굉장히 쉬운데 조금 더 깔끔하게 짤 수 없을까를 고민했다.
// 배열끼리의 곱을 지원한다면 굉장히 깔끔하게 짤 수 있을거 같은데..

func getColumn(_ arr2: [[Int]]) -> [[Int]] {
    var columns: [[Int]] = []
    for x in 0..<arr2[0].count {
        var temp: [Int] = []
        for y in 0..<arr2.count {
            temp.append(arr2[y][x])
        }
        columns.append(temp)
    }
    return columns
}

func solution(_ arr1: [[Int]], _ arr2: [[Int]]) -> [[Int]] {
    var answer: [[Int]] = []
    var columns = getColumn(arr2)
    for row in arr1 {
        var temp: [Int] = []
        for column in columns {
            var tempNumber: Int = 0
            for i in 0..<row.count {
                tempNumber += row[i] * column[i]
            }
            temp.append(tempNumber)
        }
        answer.append(temp)
    }
    return answer
}