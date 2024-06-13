import Foundation

var board: [[String]] = .init(repeating: .init(repeating: "", count: 3), count: 3)
var answer = ""
while true {
  let input = readLine()!
  if input == "end" { break }

  let inputArr = input.map { String($0) }
  var oCount = 0, xCount = 0, blankCount = 0
  for y in 0..<3 {
    for x in 0..<3 {
      board[y][x] = inputArr[y * 3 + x]
      if board[y][x] == "O" { oCount += 1 }
      else if board[y][x] == "X" { xCount += 1 }
      else { blankCount += 1 }
    }
  }
  // x's turn
  if xCount == oCount {
    let oWin = isWin("O"), xWin = isWin("X")
    if xWin && oWin { answer += "invalid\n" }
    else if oWin { answer += "valid\n" }
    else if xWin { answer += "invalid\n" }
    else if !oWin && !xWin {
      if blankCount == 0 { answer += "valid\n" }
      else { answer += "invalid\n" }
    }
  // o's turn
  } else if xCount == oCount + 1 {
    let oWin = isWin("O"), xWin = isWin("X")
    if xWin && oWin { answer += "invalid\n" }
    else if xWin { answer += "valid\n" }
    else if oWin { answer += "invalid\n" }
    else if !oWin && !xWin {
      if blankCount == 0 { answer += "valid\n" }
      else { answer += "invalid\n" }
    }
  } else {
    answer += "invalid\n"
  }
}

print(answer)

func isWin(_ type: String) -> Bool {
  // -
  for y in 0..<3 {
    var flag = true
    for x in 0..<3 {
      if board[y][x] != type { flag = false; break }
    }
    if flag { return true }
  }
  // |
  for x in 0..<3 {
    var flag = true
    for y in 0..<3 {
      if board[y][x] != type { flag = false; break }
    }
    if flag { return true }
  }
  // \
  var flag = true
  for i in 0..<3 {
    if board[i][i] != type { flag = false; break }
  }
  if flag { return true }
  // /
  flag = true
  for i in 0..<3 {
    if board[i][2 - i] != type { flag = false; break }
  }

  if flag { return true }
  return false
}