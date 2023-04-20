import Foundation

func solution(
  _ k: Int,
  _ m: Int,
  _ score: [Int]
) -> Int {
  var scoreSort = score.sorted { $0 < $1 }
  var answer: Int = 0

  while scoreSort.count >= m {
    var min = Int.max
    for _ in 0..<m {
      let last = scoreSort.removeLast()
      if min > last { min = last }
    }
    answer += min * m
  }

  return answer
}