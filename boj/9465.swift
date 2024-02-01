import Foundation

let t = Int(readLine()!)!
var answer = ""
for _ in 1...t {
  let n = Int(readLine()!)!
  var board: [[Int]] = []
  for _ in 1...2 {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    board.append(input)
  }

  var d: [[Int]] = .init(repeating: .init(repeating: 0, count: n), count: 2)
  d[0][0] = board[0][0]
  d[1][0] = board[1][0]

  for x in 1..<n {
    d[0][x] = max(d[1][x - 1] + board[0][x], d[0][x - 1])
    d[1][x] = max(d[0][x - 1] + board[1][x], d[1][x - 1])
  }

  var maxValue = max(d[0][n - 1], d[1][n - 1])
  answer += "\(maxValue)" + "\n"
}

print(answer)