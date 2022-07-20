import Foundation

// 아이디어 자체는 굉장히 단순하다. n이 100으로 제한되어 있고, 입력이 트리임이 보장되기 때문에 edge의 최대개수는 99개이다
// 따라서 n - 1개의 edge를 순차적으로 제거해보면서 최소값을 찾으면 된다.
// 하지만 swift로 bfs를 구현하는 과정에서 어려움을 겪었다.. 모든 문제를 이렇게 queue부터 써가면서 풀 수는 없는데 다른 풀이들을 많이 봐야겠다.

var adjMatrix: [[Int]] = []
var vis: [Bool] = []

struct Queue<T> {
  private var inbox: [T] = []
  private var outbox: [T] = []
  
  var isEmpty: Bool {
    return inbox.isEmpty && outbox.isEmpty
  }
  
  var front: T? {
    outbox.isEmpty ? inbox.first : outbox.last
  }
  
  mutating func push(_ input: T) {
    inbox.append(input)
  }
  
  @discardableResult
  mutating func pop() -> T? {
    if outbox.isEmpty {
      outbox = inbox.reversed()
      inbox.removeAll()
    }
    return outbox.popLast()
  }
}

func inputGraphMatrix(_ vertex: Int, _ edges: [[Int]]) {
  for edge in edges {
    let u = edge[0] - 1
    let v = edge[1] - 1
    adjMatrix[u][v] = 1
    adjMatrix[v][u] = 1
  }
}

func bfs() -> Int {
  vis = [Bool](repeating: false, count: adjMatrix.count)
  var q: Queue<Int> = Queue()
  var subVertex = 0
  for cnt in 0..<adjMatrix.count {
    var tempVertex = 0
    if vis[cnt] { continue }
    q.push(cnt)
    vis[cnt] = true
    tempVertex += 1
    while(!q.isEmpty) {
      let cur = q.front!
      q.pop()
      for i in 0..<adjMatrix.count {
        if adjMatrix[cur][i] == 0 { continue }
        let next = i
        if vis[i] { continue }
        q.push(next)
        vis[next] = true
        tempVertex += 1
      }
    }
    if subVertex == 0 {
      subVertex = tempVertex
    } else {
      subVertex = abs(subVertex - tempVertex)
    }
  }
  return subVertex
}


func solution(_ n: Int, _ wires: [[Int]]) -> Int {
  adjMatrix = [[Int]](repeating: Array(repeating: 0, count: n), count: n)
  vis = [Bool](repeating: false, count: n)
  inputGraphMatrix(n, wires)
  var answer = 100
  
  for wire in wires {
    let u = wire[0] - 1
    let v = wire[1] - 1
    adjMatrix[u][v] = 0
    adjMatrix[v][u] = 0
    var temp = bfs()
    if answer > temp {
      answer = temp
    }
    adjMatrix[u][v] = 1
    adjMatrix[v][u] = 1
  }
  
  return answer
}
