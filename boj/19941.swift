import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]

let arr = readLine()!.map { String($0) }
var vis: [Bool] = .init(repeating: true, count: arr.count)

var answer = 0
for i in 0..<arr.count {
  if arr[i] == "H" { continue }
  let minIndex = i - k <= 0 ? 0 : i - k
  let maxIndex = i + k >= n ? n - 1 : i + k
  for j in minIndex...maxIndex {
    if arr[j] == "H" && vis[j] {
      vis[j] = false; answer += 1; break
    }
  }
}

print(answer)
