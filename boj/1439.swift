import Foundation

// MARK: - 뒤집기
var s = readLine()!.map { String($0) }
var answer: Int = 0
var preValue: String = s[0]
for i in 1..<s.count {
  if s[i] != preValue {
    answer += 1
  }
  preValue = s[i]
}

print((answer + 1) / 2)
