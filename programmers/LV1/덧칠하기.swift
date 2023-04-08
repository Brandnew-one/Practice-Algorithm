import Foundation

func solution(
  _ n: Int,
  _ m: Int,
  _ section: [Int]
) -> Int {
  var answer: Int = 0
  var tempSection: Int = 1
  for s in section {
    if tempSection > s { continue }
    tempSection = s + m
    answer += 1
  }
  return answer
}