import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var d: [Int] = .init(repeating: 1, count: arr.count)

for i in 1..<arr.count {
  for j in 0..<i {
    if arr[i] > arr[j] {
      d[i] = max(d[j] + 1, d[i])
    }
  }
}

print(d.max()!)