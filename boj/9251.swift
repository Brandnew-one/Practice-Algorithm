import Foundation

// MARK: - LCS
let strArr1 = readLine()!.map { String($0) }
let strArr2 = readLine()!.map { String($0) }

var d: [[Int]] = .init(repeating: .init(repeating: 0, count: strArr1.count + 1), count: strArr2.count + 1)

for y in 1...strArr2.count {
  for x in 1...strArr1.count {
    if strArr2[y - 1] == strArr1[x - 1] {
      d[y][x] = d[y - 1][x - 1] + 1
    } else {
      d[y][x] = max(d[y - 1][x], d[y][x - 1])
    }
  }
}

print(d[strArr2.count][strArr1.count])