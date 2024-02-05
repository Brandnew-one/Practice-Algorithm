import Foundation

struct Edge {
  let destination: Int
  let cost: Int
  static func < (lhs: Edge, rhs: Edge) -> Bool {
    lhs.cost < rhs.cost
  }
}

let t = Int(readLine()!)!
let maxValue = 0x7f7f7f7f
var answer = ""
for _ in 1...t {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let n = input[0], m = input[1], w = input[2]
  var adj: [[Edge]] = .init(repeating: [], count: n + 2)

  for _ in 1...m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    adj[input[0]].append(Edge(destination: input[1], cost: input[2]))
    adj[input[1]].append(Edge(destination: input[0], cost: input[2]))
  }

  for _ in 1...w {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    adj[input[0]].append(Edge(destination: input[1], cost: -input[2]))
  }

  var d: [Int] = .init(repeating: maxValue, count: n + 2)
  d[1] = 0
  var isUpdate = false
  for _ in 1...n {
    isUpdate = false
    for i in 1...n {
      for edge in adj[i] {
        if d[i] + edge.cost >= d[edge.destination] { continue }
        d[edge.destination] = d[i] + edge.cost
        isUpdate = true
      }
    }
    if !isUpdate { break }
  }
  if isUpdate {
    answer += "YES" + "\n"
  } else {
    answer += "NO" + "\n"
  }
}

print(answer)
