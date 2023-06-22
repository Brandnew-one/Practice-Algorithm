//
//  main.swift
//  Graph
//
//  Created by Bran on 2022/07/03.
//

import Foundation

// 인접행렬을 통한 무방향성 그래프 표현
// 공간복잡도 O(V^2)
func inputGraphMatrix(_ vertex: Int, _ edges: [[Int]]) {
  var adjMatrix = [[Int]](repeating: Array(repeating: 0, count: vertex), count: vertex)
  for edge in edges {
    let u = edge[0] - 1
    let v = edge[1] - 1
    adjMatrix[u][v] = 1
    adjMatrix[v][u] = 1
  }
  for matrix in adjMatrix {
    print(matrix)
  }
}

// 인접리스트를 통한 무방향성 그래프 구현
// 공간복잡도 O(V + E)
// Swift의 Array는 Dynamic 특성 때문에 append 하는 과정이 굉장히 비효율적.
func inputGraphList(_ vertex: Int, _ edges: [[Int]]) {
  var adjList = [[Int]](repeating: [], count: vertex)
  for edge in edges {
    let u = edge[0] - 1
    let v = edge[1] - 1
    adjList[u].append(v)
    adjList[v].append(u)
  }
  for list in adjList {
    print(list)
  }
}

inputGraphMatrix(5, [[3, 1], [2, 3], [4, 1], [5, 2], [5, 4], [3, 5], [2, 4]])
inputGraphList(5, [[3, 1], [2, 3], [4, 1], [5, 2], [5, 4], [3, 5], [2, 4]])

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

// bfs
var adjList = [[Int]](repeating: [], count: 5)
var adjMatrix = [[Int]](repeating: Array(repeating: 0, count: 5), count: 5)
var vis = [Bool](repeating: false, count: 5)

func bfsArray() {
  var q: Queue<Int> = Queue()
  q.push(1)
  vis[1] = true
  while(!q.isEmpty) {
    let cur = q.front!
    q.pop()
    for v in adjMatrix[cur] {
      if v == 0 { continue }
      let next = v
      if vis[next] { continue }
      q.push(next)
      vis[next] = true
    }
  }
}

func bfsList() {
  var q: Queue<Int> = Queue()
  q.push(1)
  vis[1] = true
  while(!q.isEmpty) {
    let cur = q.front!
    q.pop()
    for v in adjList[cur] {
      let next = v
      if vis[next] { continue }
      q.push(next)
      vis[next] = true
    }
  }
}

// 플로이드 알고리즘
func ployd(_ vertex: Int, _ edges: [[Int]]) {
  var distance = [[Int]](repeating: Array(repeating: Int.max / 2, count: vertex + 2), count: vertex + 2)
  for i in 1...vertex {
    distance[i][i] = 0
  }
  for edge in edges {
    let u = edge[0]
    let v = edge[1]
    let d = edge[2]
    distance[u][v] = min(d, distance[u][v])
    distance[v][u] = min(d, distance[u][v])
  }

  for k in 1...vertex {
    for i in 1...vertex {
      for j in 1...vertex {
        distance[i][j] = min(distance[i][j], distance[i][k] + distance[k][j])
      }
    }
  }
}

print("------")

func solution(_ data: [[Int]], _ col: Int, _ row_begin: Int, _ row_end: Int) -> Int {
  let sortedData = data.sorted {
    if $0[col - 1] == $1[col - 1] {
      return $0[0] < $1[0]
    } else {
      return $0[col - 1] > $1[col - 1]
    }
  }

  var dataArr: [Int] = []
  for i in row_begin...row_end {
    let tuple = sortedData[i - 1]
    var modSum: Int = 0
    for t in tuple {
      modSum += t % i
    }
    dataArr.append(modSum)
  }

  var answer: Int = 0
  for i in 0..<dataArr.count - 1 {
    answer += dataArr[i] ^ dataArr[i + 1]
  }

  return answer
}
