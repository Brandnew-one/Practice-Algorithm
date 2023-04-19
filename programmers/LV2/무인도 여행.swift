import Foundation

struct Queue<T> {
  private var elements: [T] = []
  private var firstIndex: Int = 0

  var isEmpty: Bool { count == 0 }
  var count: Int { elements.count - firstIndex }
  var front: T { elements[firstIndex] }

  init(_ elements: [T] = []) {
    self.elements = elements
  }

  mutating func enqueue(_ element: T) {
    elements.append(element)
  }

  @discardableResult
  mutating func dequeue() -> T? {
    if elements.count <= firstIndex { return nil }
    defer { firstIndex += 1 }
    return elements[firstIndex]
  }
}

let dy: [Int] = [-1, 1, 0 ,0]
let dx: [Int] = [0, 0, -1, 1]
var board: [[String]] = Array(
  repeating: Array(repeating: "", count: 102),
  count: 102
)
var vis: [[Bool]] = Array(
  repeating: Array(repeating: false, count: 100),
  count: 102
)


func solution(
  _ maps: [String]
) -> [Int] {
  // initalize parm
  let h = maps.count
  let w = maps[0].count
  var q = Queue<(y: Int, x: Int)>()
  var answer: [Int] = []

  // initalize map
  for y in 0..<h {
    let map = maps[y].map { String($0) }
    for x in 0..<w {
      board[y][x] = map[x]
    }
  }

  // dfs
  for y in 0..<h {
    for x in 0..<w {
      var temp: Int = 0
      if board[y][x] != "X" && !vis[y][x] {
        q.enqueue((y, x))
        vis[y][x] = true
        temp += Int(board[y][x])!
      }
      while(!q.isEmpty) {
        if let cur = q.dequeue() {
          for dir in 0..<4 {
            let ny = cur.y + dy[dir]
            let nx = cur.x + dx[dir]
            if ny < 0 || ny >= h || nx < 0 || nx >= w { continue }
            if vis[ny][nx] || board[ny][nx] == "X" { continue }
            q.enqueue((ny, nx))
            vis[ny][nx] = true
            temp += Int(board[ny][nx])!
          }
        }
      }
      if temp != 0 {
        answer.append(temp)
      }
    }
  }
  if answer.isEmpty {
    return [-1]
  } else {
    return answer.sorted { $0 < $1 }
  }
}