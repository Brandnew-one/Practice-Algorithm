import Foundation

// MARK: - 비트마스킹 + DP
let n = Int(readLine()!)!
var d:[[[Int]]] = .init(repeating: .init(repeating: .init(repeating: 0, count: 1024), count: 10), count: 100 + 1)
let v = 1 << 10
let mod = 1000000000

if n >= 2 {
  // inital Setting
  for i in 1...9 {
    d[1][i][1 << i] = 1
  }

  for i in 2...n {
    for j in 0...9 {
      for k in 0..<v {
        if j < 9 {
          let next = k | (1 << (j + 1))
          d[i][j + 1][next] += d[i - 1][j][k]
          d[i][j + 1][next ] %= mod
        }
        if j > 0 {
          let next = k | (1 << (j - 1))
          d[i][j - 1][next] += d[i - 1][j][k]
          d[i][j - 1][next ] %= mod
        }
      }
    }
  }

  var answer = 0
  for i in 0...9 {
    answer += d[n][i][1023]
    answer %= mod
  }
  print(answer)
} else {
  print("0")
}
