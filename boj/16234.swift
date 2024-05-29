import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], l = input[1], r = input[2]

var board: [[Int]] = []
for _ in 1...n {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  board.append(input)
}

let dy = [-1, 1, 0, 0]
let dx = [0, 0, -1, 1]
var answer = 0

while check() {
  var vis: [[Bool]] = .init(repeating: .init(repeating: false, count: n), count: n)
  answer += 1
  for y in 0..<n {
    for x in 0..<n {
      if vis[y][x] { continue }
      var sum = 0
      var coordinates: [(Int, Int)] = []

      var queue: [(Int, Int)] = []
      var front = 0

      queue.append((y, x))
      coordinates.append((y, x))
      vis[y][x] = true
      sum += board[y][x]

      while queue.count >= front + 1 {
        let cur = queue[front], currentValue = board[cur.0][cur.1]
        front += 1

        for dir in 0..<4 {
          let ny = cur.0 + dy[dir], nx = cur.1 + dx[dir]
          if ny < 0 || ny >= n || nx < 0 || nx >= n { continue }
          if vis[ny][nx] { continue }
          let nextValue = board[ny][nx]
          if abs(currentValue - nextValue) >= l && abs(currentValue - nextValue) <= r {
            coordinates.append((ny, nx))
            queue.append((ny, nx))
            vis[ny][nx] = true
            sum += nextValue
          }
        }
      }

      let avg = sum / coordinates.count
      for coordinate in coordinates {
        board[coordinate.0][coordinate.1] = avg
      }
    }
  }
}

print(answer)

func check() -> Bool {
  for y in 0..<n {
    for x in 0..<n {
      let cur = board[y][x]
      for dir in 0..<4 {
        let ny = y + dy[dir], nx = x + dx[dir]
        if ny < 0 || ny >= n || nx < 0 || nx >= n { continue }
        if abs(board[ny][nx] - cur) >= l && abs(board[ny][nx] - cur) <= r {
          return true
        }
      }
    }
  }
  return false
}
