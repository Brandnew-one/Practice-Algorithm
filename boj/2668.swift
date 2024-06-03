import Foundation

let n = Int(readLine()!)!
var board: [Int] = [-1]

for _ in 1...n {
  let input = Int(readLine()!)!
  board.append(input)
}

var answer = 0
var cycles: [[Int]] = []
var vis: [Bool] = .init(repeating: false, count: n + 1)

for i in 1...n {
  if vis[i] { continue }
  var tempVis: [Bool] = .init(repeating: false, count: n + 1)
  var temp: [Int] = []
  var isCycle = false

  var stack: [Int] = []
  stack.append(i)
  temp.append(i)
  tempVis[i] = true

  while !stack.isEmpty {
    let cur = stack.removeLast()
    let next = board[cur]

    if next == i { isCycle = true }
    if tempVis[next] { continue }
    stack.append(next)
    temp.append(next)
    tempVis[next] = true
  }

  if isCycle {
    cycles.append(temp.sorted { $0 < $1 })
    for i in 1...n {
      if tempVis[i] { vis[i] = true }
    }
  }
}

let cycleArr = cycles.flatMap { $0 }.sorted { $0 < $1 }
print(cycleArr.count)
for element in cycleArr {
  print(element)
}
