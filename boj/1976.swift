import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!

var transitivity: [[Bool]] = .init(repeating: .init(repeating: false, count: n + 1), count: n + 1)
for i in 1...n {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  for j in 1...n {
    transitivity[i][j] = input[j - 1] == 0 ? false : true
  }
}

for i in 1...n {
  transitivity[i][i] = true
}

let trip = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 < $1 }

for k in 1...n {
  for i in 1...n {
    for j in 1...n {
      if transitivity[i][k] && transitivity[k][j] {
        transitivity[i][j] = true
      }
    }
  }
}

var flag = true
for i in 1..<trip.count {
  if !transitivity[trip[i - 1]][trip[i]] { flag = false; break }
}

if flag {
  print("YES")
} else {
  print("NO")
}
