import Foundation

// 생각해보니 Swift로 그래프관련 자료구조를 구현해본적이 없었다.. 조만간 정리해서 한번 올려야겠다.
// 1번 도시로 부터 모든 도시로 가는 최단거리를 구하면 된다.
// N = 50으로 굉장히 작기 때문에 모든 정점쌍 사이의 최단거리를 구하는 플로이드 알고리즘을 이용했다. O(N^3)

func ployd(_ vertex: Int, _ edges: [[Int]], _ ref: Int) -> Int {
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
  var answer: Int = 0
  for i in 1...vertex {
    if distance[1][i] <= ref {
      answer += 1
    }
  }
  return answer
}


func solution(_ N: Int, _ road: [[Int]], _ k: Int) -> Int {
  return ployd(N, road, k)
}