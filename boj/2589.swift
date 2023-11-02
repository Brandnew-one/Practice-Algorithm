import Foundation

// O(2500 * 2500)

let input = readLine()!.split(separator: " ").map { Int($0)! }
let l = input[0]
let w = input[1]

var board: [[String]] = []
let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]
var answer = -1

for _ in 0..<l {
  let input = readLine()!.map { String($0) }
  board.append(input)
}

for y in 0..<l {
  for x in 0..<w {
    if board[y][x] == "W" { continue }

    var queue: [(Int, Int)] = []
    var index = 0
    var vis: [[Int]] = .init(repeating: .init(repeating: -1, count: w), count: l)
    queue.append((y, x))
    vis[y][x] = 0

    while queue.count >= index + 1 {
      let cur = queue[index]
      index += 1

      for dir in 0..<4 {
        let ny = cur.0 + dy[dir]
        let nx = cur.1 + dx[dir]

        if ny < 0 || ny >= l || nx < 0 || nx >= w { continue }
        if vis[ny][nx] != -1 { continue }
        if board[ny][nx] == "W" { continue }

        queue.append((ny, nx))
        vis[ny][nx] = vis[cur.0][cur.1] + 1
      }
    }

    for i in 0..<l {
      for j in 0..<w {
        if vis[i][j] >= answer { answer = vis[i][j] }
      }
    }
  }
}

print(answer)
