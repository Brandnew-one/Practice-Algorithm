import Foundation

let dy: [Int] = [-1, -1, 0]
let dx: [Int] = [-1, 0, -1]

func solution(_ board: [[Int]]) -> Int {
  var tempBoard = [[Int]](repeating: Array(repeating: 0, count: board[0].count), count: board.count)
  tempBoard = board

  for y in 1..<board.count {
    for x in 1..<board[0].count {
      if board[y][x] == 1 {
        tempBoard[y][x] = min(tempBoard[y - 1][x - 1], tempBoard[y - 1][x], tempBoard[y][x - 1]) + 1
      }
    }
  }

  var answer: Int = 0
  for y in 0..<tempBoard.count {
    for x in 0..<tempBoard[0].count {
      if tempBoard[y][x] >= answer {
        answer = tempBoard[y][x]
      }
    }
  }

  return answer * answer
}
