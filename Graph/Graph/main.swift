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


