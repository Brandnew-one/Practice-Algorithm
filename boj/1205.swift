import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], score = input[1], p = input[2]
var scores: [Int] = []

if n > 0 {
  scores = readLine()!.split(separator: " ").map { Int($0)! }
} else {
  print("1"); exit(0)
}

if n >= p && score <= scores.last! {
  print("-1"); exit(0)
}

var count = 0
for rank in scores {
  if rank > score {
    count += 1
  }
}

print(count + 1)