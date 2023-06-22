//
//  Heap.swift
//  Graph
//
//  Created by Bran on 2023/06/05.
//

import Foundation

//struct Heap<T: Comparable> {
//  var heap: [T] = []
//
//  // MARK: - 0번 인덱스를 위한 타입 이니셜라이저
//  /// 더 좋은 방법 생각나면 수정하기
//  init(type: T) {
//    heap.append(type)
//  }
//
//  // MARK: - O(logN)
//  mutating func insert(_ value: T) {
//    if heap.count == 1 {
//      heap.append(value)
//      return
//    }
//
//    heap.append(value)
//    let insertIndex = heap.count - 1
//
//    while(isMoveUp(insertIndex)) {
//      let parentIndex = insertIndex / 2
//      heap.swapAt(insertIndex, parentIndex)
//    }
//  }
//
//  // MARK: - O(logN)
//  /// remove Root
//  mutating func pop() -> T? {
//    if heap.count <= 1 { return nil }
//
//    let returnData = heap[1]
//    heap.swapAt(1, heap.count - 1)
//    heap.removeLast()
//
//    var poppedIndex = 1
//    while true {
//      switch moveDown(poppedIndex) {
//      case .none:
//        return returnData
//      case .left:
//        let leftChildIndex = poppedIndex * 2
//        heap.swapAt(poppedIndex, leftChildIndex)
//        poppedIndex = leftChildIndex
//      case .right:
//        let rightChildIndex = (poppedIndex * 2) + 1
//        heap.swapAt(poppedIndex, rightChildIndex)
//        poppedIndex = rightChildIndex
//      }
//    }
//  }
//
//}
//
//extension Heap {
//  enum moveDownStatus {
//    case left, right
//    case none
//  }
//
//  private func isMoveUp(_ insertIndex: Int) -> Bool {
//    if insertIndex <= 1 { return false }
//    let parentIndex = insertIndex / 2
//    return heap[insertIndex] < heap[parentIndex] ? true : false
//  }
//
//  func moveDown(_ poppedIndex: Int) -> moveDownStatus {
//    let leftChildIndex = poppedIndex * 2
//    let rightCildIndex = leftChildIndex + 1
//
//    // case1. 모든(왼쪽) 자식 노드가 없는 경우 (완전이진트리는 왼쪽부터 채워지므로)
//    if leftChildIndex >= heap.count {
//      return .none
//    }
//
//    // case2. 왼쪽 자식 노드만 있는 경우
//    if rightCildIndex >= heap.count {
//      return heap[leftChildIndex] < heap[poppedIndex] ? .left : .none
//    }
//
//    // case3. 왼쪽 & 오른쪽 자식 노드 모두 있는 경우
//    // case 3-1. 자식들이 자신보다 모두 작은 경우
//    if heap[leftChildIndex] > heap[poppedIndex] && heap[rightCildIndex] > heap[poppedIndex] {
//      return .none
//    }
//
//    // case 3-2. 자식들이 자신보다 모두 큰 경우 (왼쪽과 오른쪽 자식 중 더 큰 자식 선별)
//    if heap[leftChildIndex] < heap[poppedIndex] && heap[rightCildIndex] < heap[poppedIndex] {
//      return heap[leftChildIndex] < heap[rightCildIndex] ? .left : .right
//    }
//
//    // case 3-3. 왼쪽 & 오른쪽 중 한 자식만 자신보다 큰 경우
//    return heap[leftChildIndex] < heap[poppedIndex] ? .left : .right
//  }
//}

struct Heap<T: Comparable> {
  var nodes: [T] = []
  let sort: (T, T) -> Bool
  
  init(sort: @escaping (T, T) -> Bool) {
    self.sort = sort
  }
  
  var isEmpty: Bool {
    return nodes.isEmpty
  }
  
  mutating func insert(_ element: T) {
    var index = nodes.count
    nodes.append(element)
    while index > 0 && sort(nodes[index], nodes[(index-1)/2]) {
      nodes.swapAt(index, (index-1)/2)
      index = (index-1)/2
    }
  }
  
  mutating func pop() -> T {
    
    nodes.swapAt(0, nodes.count-1)
    let poped = nodes.removeLast()
    var index = 0
    
    // 자식이 있는 인덱스만
    while index * 2 + 1 < nodes.count {
      let leftChild = index * 2 + 1
      let rightChild = leftChild + 1
      
      // 왼쪽 오른쪽 자식 둘다 있는경우 -> 둘중 크고 부모보다 크면 스왑
      if rightChild < nodes.count {
        let child = sort(nodes[leftChild], nodes[rightChild]) ? leftChild : rightChild
        
        if sort(nodes[child], nodes[index]) {
          nodes.swapAt(child, index)
          index = child
        } else {
          break
        }
        
        // 왼쪽 자식막 있는경우 -> 부모보다 크면 스왑
      } else {
        if sort(nodes[leftChild], nodes[index]) {
          nodes.swapAt(leftChild, index)
          index = leftChild
        } else {
          break
        }
      }
    }
    return poped
  }
}
