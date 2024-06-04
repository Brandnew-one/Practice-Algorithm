import Foundation

struct Heap<T: Comparable> {
  enum HeapType { case min, max }

  private var elements: [T?] = [nil]
  var size = 0
  private let type: HeapType

  init(_ type: HeapType) {
    self.type = type
  }

  var top: T? {
    size > 0 ? elements[1] : nil
  }

  var isEmpty: Bool {
    size == 0
  }

  mutating func insert(with element: T) {
    elements.append(element)
    size += 1

    var index = size
    while index > 1 {
      let parent = index / 2
      if type == .min && elements[parent]! <= elements[index]! { break }
      if type == .max && elements[parent]! >= elements[index]! { break }
      elements.swapAt(parent, index)
      index = parent
    }
  }

  @discardableResult
  mutating func delete() -> T? {
    if size == 0 {
      return nil
    } else {
      let pop = elements[1] // root
      var index = 1

      elements[1] = elements[size]
      elements.removeLast()
      size -= 1

      while index * 2 <= size {
        let lc = index * 2, rc = index * 2 + 1
        var c: Int

        if type == .min {
          if rc <= size && elements[lc]! > elements[rc]! { c = rc }
          else { c = lc }
          if elements[index]! <= elements[c]! { break }
        } else {
          if rc <= size && elements[lc]! < elements[rc]! { c = rc }
          else { c = lc }
          if elements[index]! >= elements[c]! { break }
        }

        elements.swapAt(index, c)
        index = c
      }

      return pop
    }
  }
}

let n = Int(readLine()!)!
var numbers: [Int] = []
for _ in 1...n {
  let input = Int(readLine()!)!
  numbers.append(input)
}
var minHeap = Heap<Int>(.min)
var maxHeap = Heap<Int>(.max)
var answer = ""

for number in numbers {
  // 첫번째 원소가 들어오는 경우
  if minHeap.isEmpty && maxHeap.isEmpty {
    maxHeap.insert(with: number)
  // 두번째 원소가 들어오는 경우
  } else if minHeap.isEmpty && !maxHeap.isEmpty {
    maxHeap.insert(with: number)
    minHeap.insert(with: maxHeap.delete()!)
  } else {
    if minHeap.size == maxHeap.size {
      minHeap.insert(with: number)
      maxHeap.insert(with: minHeap.delete()!)
    } else {
      maxHeap.insert(with: number)
      minHeap.insert(with: maxHeap.delete()!)
    }
  }
  answer += "\(maxHeap.top!)\n"
}

print(answer)
