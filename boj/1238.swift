import Foundation

struct Heap<T: Comparable> {
  private var elements: [T] = []
  private let sortFunction: (T, T) -> Bool

  var isEmpty: Bool {
    return self.elements.count == 1
  }
  var peek: T? {
    if self.isEmpty { return nil }
    return self.elements.last!
  }
  var count: Int {
    return self.elements.count - 1
  }

  init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
    if !elements.isEmpty {
      self.elements = [elements.first!] + elements
    } else {
      self.elements = elements
    }
    self.sortFunction = sortFunction
    if elements.count > 1 {
      self.buildHeap()
    }
  }

  func leftChild(of index: Int) -> Int {
    return index * 2
  }
  func rightChild(of index: Int) -> Int {
    return index * 2 + 1
  }
  func parent(of index: Int) -> Int {
    return (index) / 2
  }
  mutating func add(element: T) {
    self.elements.append(element)
  }

  private mutating func diveDown(from index: Int) {
    var higherPriority = index
    let leftIndex = self.leftChild(of: index)
    let rightIndex = self.rightChild(of: index)

    if leftIndex < self.elements.endIndex && self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
      higherPriority = leftIndex
    }
    if rightIndex < self.elements.endIndex && self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
      higherPriority = rightIndex
    }
    if higherPriority != index {
      self.elements.swapAt(higherPriority, index)
      self.diveDown(from: higherPriority)
    }
  }

  private mutating func swimUp(from index: Int) {
    var index = index
    while index != 1 && self.sortFunction(self.elements[index], self.elements[self.parent(of: index)]) {
      self.elements.swapAt(index, self.parent(of: index))
      index = self.parent(of: index)
    }
  }

  private mutating func buildHeap() {
    for index in (1...(self.elements.count / 2)).reversed() {
      self.diveDown(from: index)
    }
  }

  mutating func insert(node: T) {
    if self.elements.isEmpty {
      self.elements.append(node)
    }
    self.elements.append(node)
    self.swimUp(from: self.elements.endIndex - 1)
  }

  mutating func remove() -> T? {
    if self.isEmpty { return nil }
    self.elements.swapAt(1, elements.endIndex - 1)
    let deleted = elements.removeLast()
    self.diveDown(from: 1)

    return deleted
  }
}

struct Edge: Comparable {
  let destination: Int
  let cost: Int
  static func < (lhs: Edge, rhs: Edge) -> Bool {
    lhs.cost < rhs.cost
  }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0], m = input[1], x = input[2]
var adj: [[Edge]] = .init(repeating: [], count: n + 2)
for _ in 1...m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  let edge = Edge(destination: input[1], cost: input[2])
  adj[input[0]].append(edge)
}

var costs: [[Int]] = .init(repeating: .init(repeating: .max, count: n + 2), count: n + 2)
for start in 1...n {
  var d: [Int] = .init(repeating: .max, count: n + 2)
  var heap = Heap<Edge>(sortFunction: <)
  d[start] = 0
  heap.insert(node: .init(destination: start, cost: 0))

  while !heap.isEmpty {
    let cur = heap.remove()!
    if cur.cost != d[cur.destination] { continue }
    for next in adj[cur.destination] {
      if d[next.destination] <= cur.cost + next.cost { continue }
      d[next.destination] = cur.cost + next.cost
      heap.insert(node: .init(destination: next.destination, cost: d[next.destination]))
    }
  }
  for x in 1...n {
    costs[start][x] = d[x]
  }
}

var maxValue = -1
for i in 1...n {
  let ref = costs[i][x] + costs[x][i]
  if ref >= maxValue { maxValue = ref }
}

print(maxValue)