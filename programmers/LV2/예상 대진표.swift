import Foundation

// 문제조건에 a < b 라는 전제조건이 없는데 이걸 고려하지 못하고 풀다가 맞왜틀의 연속이였다...
// 1 ~ 2^(n-1) : a, 2^(n-1) + 1 ~ 2^n : b 이렇게 a,b가 분포되면 n번 경기를 해야한다는 규칙을 이용해서 해당 내용을 구현했다.
// 시간복잡도는 O(log2(N))으로 최악의 경우에도 20번정도면 풀이가 가능하다!

// MARK: - 무조건 2의 거듭제곱이 들어온다는 가정
func findPower(_ a: Int) -> Int {
  var num: Int = a
  var n: Int = 0
  while num > 1 {
    num /= 2
    n += 1
  }
  return n
}

func solution(_ n: Int, _ a: Int, _ b: Int) -> Int {
  var refNumber = n
  var refA = a
  var refB = b
  if a >= b {
    refA = b
    refB = a
  }

  while true {
    if (1...refNumber / 2).contains(refA) && (refNumber / 2 + 1...refNumber).contains(refB) {
      return findPower(refNumber)
    } else if (1...refNumber / 2).contains(refA) && (1...refNumber / 2).contains(refB) {
      refNumber /= 2
    } else {
      refA -= refNumber / 2
      refB -= refNumber / 2
      refNumber /= 2
    }
  }
}
