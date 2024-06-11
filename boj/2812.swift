import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], k = input[1]
let numbers = readLine()!.map { String($0) }.map { Int($0)! }

var stack: [Int] = []
var count = 0

for number in numbers {
  if let top = stack.last {
    if count >= k {
      stack.append(number)
    } else {
      if top >= number { stack.append(number) }
      else {
        while true {
          if count >= k { break }
          if let last = stack.last {
            if last >= number { break }
            else {
              stack.removeLast()
              count += 1
            }
          } else { break }
        }
        stack.append(number)
      }
    }
  } else {
    stack.append(number)
  }
}

let remain = k - count
if remain > 0 {
  for _ in 1...remain { stack.removeLast() }
}

var answer = ""
for i in stack.count - n + k...stack.count - 1 {
  answer += "\(stack[i])"
}

print(answer)
