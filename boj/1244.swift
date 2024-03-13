import Foundation

let n = Int(readLine()!)!
var `switch` = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!

for _ in 1...m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  if input[0] == 1 {
    var unit = input[1]
    while true {
      if unit > n { break }
      if `switch`[unit - 1] == 1 {
        `switch`[unit - 1] = 0
      } else {
        `switch`[unit - 1] = 1
      }
      unit += input[1]
    }
  } 
  else {
    var unit = 1
    while true {
      if input[1] - unit - 1 < 0 || input[1] + unit - 1 >= n { break }
      if `switch`[input[1] - unit - 1] != `switch`[input[1] + unit - 1] { break }
      unit += 1
    }
    unit -= 1
    for i in input[1] - unit - 1...input[1] + unit - 1 {
      if `switch`[i] == 1 {
        `switch`[i] = 0
      } else {
        `switch`[i] = 1
      }
    }
  }
}

var answer = ""
for i in 0..<`switch`.count {
  if i % 20 == 0 && i != 0 { answer += "\n" }
  answer += "\(`switch`[i]) "
}

print(answer)
