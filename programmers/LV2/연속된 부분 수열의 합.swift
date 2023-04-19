import Foundation

// MARK: - 투 포인터, 부분합
/// swift로 해당 알고리즘을 구현본적이 없기도하고, 코테 공부를 오래 쉬어서 그런지 해결하는데 오래걸림
/// 비슷한 유형 다시 풀어보기!

func solution(
  _ sequence: [Int],
  _ k: Int
) -> [Int] {
  var answerS: Int = 0
  var answerE: Int = Int.max
  var sum: Int = sequence[0]
  var s: Int = 0
  var e: Int = 0

  while e < sequence.count {
    if sum > k {
      sum -= sequence[s]
      s += 1
    } else if sum < k {
      e += 1
      if e < sequence.count {
        sum += sequence[e]
      }
    } else {
      if e - s < answerE - answerS {
        answerS = s
        answerE = e
      }
      sum -= sequence[s]
      s += 1
    }
  }

  return [answerS, answerE]
}