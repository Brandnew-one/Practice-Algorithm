import Foundation

// MARK: - 주식
let t = Int(readLine()!)!
for _ in 1...t {
  let _ = readLine()!
  let arr = readLine()!.split(separator: " ").map { Int64($0)! }
  print(solution(arr: arr))
}

func solution(arr: [Int64]) -> Int64 {
  var invertedArr = arr
  var maxValue: Int64 = 0
  var answer: Int64 = 0
  invertedArr.reverse()

  for element in invertedArr {
    if element > maxValue {
      maxValue = element
    } else if element < maxValue {
      answer += (maxValue - element)
    } else {
      continue
    }
  }

  return answer
}
