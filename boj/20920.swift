import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1]
var wordSet: [String: Int] = [:]

for _ in 1...n {
  let word = readLine()!
  if word.count >= m {
    if let count = wordSet[word] {
      wordSet[word] = count + 1
    } else {
      wordSet[word] = 1
    }
  }
}

var wordArr = wordSet.sorted {
  if $0.value == $1.value {
    if $0.key.count == $1.key.count {
      return $0.key < $1.key
    } else {
      return $0.key.count > $1.key.count
    }
  } else {
    return $0.value > $1.value
  }
}

var answer = ""
for word in wordArr {
  answer += "\(word.key)\n"
}

print(answer)
