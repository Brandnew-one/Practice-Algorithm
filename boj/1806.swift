import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], s = input[1]
let arr = readLine()!.split(separator: " ").map { Int($0)! }
var d: [Int] = .init(repeating: 0, count: arr.count)

d[0] = arr[0]
for i in 1..<arr.count {
  d[i] = d[i - 1] + arr[i]
}

var start = 0
var end = 0
var answer = Int.max

while true {
  if end >= n { break }
  if start == end {
    if arr[start] >= s {
      answer = 1
      break
    } else {
      end += 1
    }
  } else if d[end] - d[start] + arr[start] >= s {
    if answer > end - start + 1 {
      answer = end - start + 1
    }
    start += 1
  } else {
    end += 1
  }
}

if answer == Int.max {
  print("0")
} else {
  print(answer)
}