import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let INF = 0x3f3f3f3f
let v = input[0]
let e = input[1]

var d: [[Int]] = .init(repeating: .init(repeating: INF, count: v + 1), count: v + 1)
for _ in 1...e {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  d[input[0]][input[1]] = input[2]
}

for k in 1...v {
  for i in 1...v {
    for j in 1...v {
      d[i][j] = min(d[i][j], d[i][k] + d[k][j])
    }
  }
}

var answer = INF
for i in 1...v {
  if d[i][i] <= answer { answer = d[i][i] }
}

if answer == INF {
  print("-1")
} else {
  print(answer)
}