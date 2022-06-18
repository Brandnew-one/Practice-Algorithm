import Foundation

/// 등차수열의 합 공식을 활용하는 방법도 있음 -> 만약 시간복잡도를 더 줄이고 싶을 경우
///  return Int64(a + b) * Int64(max(a, b) - min(a, b) + 1) / Int64(2)

func solution(_ a: Int, _ b: Int) -> Int64 {
  var answer: Int64 = 0
  if a <= b {
    for num in a...b {
      answer += Int64(num)
    }
  } else {
    for num in b...a {
      answer += Int64(num)
    }
  }
  return answer
}

