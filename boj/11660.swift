import Foundation

// MARK: - print()으로 인한 시간초과 이슈
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var board: [[Int]] = []
for _ in 1...n {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  board.append(input)
}

var d: [[Int]] = .init(repeating: .init(repeating: 0, count: n), count: n)
for y in 0..<n {
  for x in 0..<n {
    if y - 1 >= 0 { d[y][x] += d[y - 1][x] }
    if x - 1 >= 0 { d[y][x] += d[y][x - 1] }
    if y - 1 >= 0 && x - 1 >= 0 { d[y][x] -= d[y - 1][x - 1] }
    d[y][x] += board[y][x]
  }
}

var answer = ""
for _ in 1...m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  answer += "\(rangeSum(input[0] - 1, input[1] - 1, input[2] - 1, input[3] - 1))" + "\n"
}

print(answer)

func rangeSum(_ y1: Int, _ x1: Int, _ y2: Int, _ x2: Int) -> Int {
  var ans = d[y2][x2]
  if x1 - 1 >= 0 { ans -= d[y2][x1 - 1] }
  if y1 - 1 >= 0 { ans -= d[y1 - 1][x2] }
  if x1 - 1 >= 0 && y1 - 1 >= 0 { ans += d[y1 - 1][x1 - 1] }
  return ans
}
