import Foundation

var d: [Int] = Array(repeating: Int.max - 1, count: 1000002)

func solution(
  _ x: Int,
  _ y: Int,
  _ n: Int
) -> Int {
  d[x] = 0
  for i in x...y {
    if i + n <= y {
      d[i + n] = min(d[i + n], d[i] + 1)
    }

    if i * 2 <= y {
      d[i * 2] = min(d[i * 2], d[i] + 1)
    }

    if i * 3 <= y {
      d[i * 3] = min(d[i * 3], d[i] + 1)
    }
  }

  if d[y] == Int.max - 1 {
    return -1
  } else {
    return d[y]
  }
}
