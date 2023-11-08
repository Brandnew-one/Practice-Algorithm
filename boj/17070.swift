import Foundation

// 상(0), 우(1), 대(2)
func dfs(_ y: Int, _ x: Int, _ dir: Int) {
  // 오른쪽
  if dir == 1 || dir == 2 {
    let index = !(x + 1 < 0 || x + 1 >= n)
    if index && !(board[y][x + 1] == 1) {
      vis[y][x + 1] += 1
      dfs(y, x + 1, 1)
    }
  }

  // 대각선
  if dir == 0 || dir == 1 || dir == 2 {
    let index = !(y < 0 || y + 1 >= n || x < 0 || x + 1 >= n)
    if index && !(board[y + 1][x + 1] == 1 || board[y][x + 1] == 1 || board[y + 1][x] == 1) {
      vis[y + 1][x + 1] += 1
      dfs(y + 1, x + 1, 2)
    }
  }

  // 아래
  if dir == 0 || dir == 2 {
    let index = !(y + 1 < 0 || y + 1 >= n)
    if index && !(board[y + 1][x] == 1) {
      vis[y + 1][x] += 1
      dfs(y + 1, x, 0)
    }
  }
}

let n = Int(readLine()!)!
var board: [[Int]] = []
var vis: [[Int]] = .init(repeating: .init(repeating: 0, count: n), count: n)

for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  board.append(input)
}

vis[0][1] = 1
dfs(0, 1, 1)

print(vis[n - 1][n - 1])
