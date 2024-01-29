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

struct Bus: Comparable {
  let city: Int
  let cost: Int
  static func < (lhs: Bus, rhs: Bus) -> Bool {
    lhs.cost < rhs.cost
  }
}

let n = Int(readLine()!)!
let m = Int(readLine()!)!
var d: [Int] = .init(repeating: .max, count: n + 2)
var adj: [[Bus]] = .init(repeating: [], count: n + 2)
for _ in 1...m {
  let input = readLine()!.split(separator: " ").map { Int($0)! }
  adj[input[0]].append(Bus(city: input[1], cost: input[2]))
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let start = input[0], end = input[1]

var heap = Heap<Bus>(sortFunction: <)
d[start] = 0
heap.insert(node: .init(city: start, cost: 0))

while !heap.isEmpty {
  let cur = heap.remove()!
  if d[cur.city] != cur.cost { continue }
  for next in adj[cur.city] {
    if d[next.city] <= cur.cost + next.cost { continue }
    d[next.city] = cur.cost + next.cost
    heap.insert(node: .init(city: next.city, cost: d[next.city]))
  }
}

print(d[end])
