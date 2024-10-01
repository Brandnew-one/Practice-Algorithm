import Foundation

// MARK: - 기타줄1
var input = readLine()!.split(separator: " ").map { Int(String($0))! }
var n = input[0]
let m = input[1]

var priceSet: [Int] = []
var priceOne: [Int] = []

for _ in 0..<m {
  input = readLine()!.split(separator: " ").map { Int(String($0))! }
  priceSet.append(input[0])
  priceOne.append(input[1])
}

priceSet.sort { $0 < $1 }
priceOne.sort { $0 < $1 }

var answer: Int = 0

while n > 0 {
  if n >= 6 {
    if priceSet[0] > priceOne[0] * 6 {
      answer += priceOne[0] * 6
      n -= 6
    } else {
      answer += priceSet[0]
      n -= 6
    }
  } else {
    if priceOne[0] * n >= priceSet[0] {
      answer += priceSet[0]
      n -= 6
    } else {
      answer += priceOne[0] * n
      n = 0
    }
  }
}

print(answer)
