import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let l = input[0]
let c = input[1]

let keySet = readLine()!.split(separator: " ").map { String($0) }.sorted { $0 < $1 }
let moum: Set<Character> = .init(["a", "e", "i", "o", "u"])
let zaoum: Set<Character> = .init(
  [
    "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n",
    "p", "q", "r", "s", "t", "v", "w", "x", "y", "z"
  ]
)

var vis: [Bool] = .init(repeating: false, count: c)
var answer: [String] = []

func dfs(_ start: Int, _ str: String) {
  if str.count == l { answer.append(str); return }

  for i in start..<c {
    if !vis[i] {
      let temp = str + keySet[i]
      vis[i] = true
      dfs(i, temp)
      vis[i] = false
    }
  }
}

for i in 0...c-l {
  vis[i] = true
  dfs(i, keySet[i])
}

answer = answer.filter { str -> Bool in
  Set(str.map { $0 }).intersection(moum).count >= 1
}

answer = answer.filter { str -> Bool in
  Set(str.map { $0 }).intersection(zaoum).count >= 2
}

for ans in answer {
  print(ans)
}

