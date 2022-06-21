import Foundation

// 처음에 무식하게 쌩구현으로 구현했었는데 시간초과가 났다 ㅠㅠ -> String.Element 와 Character 타입은 동등 비교 연산이 가능하다!
// Stack의 개념을 이용하면 O(N)으로 풀 수 있다.

func solution(_ s: String) -> Int {
  let array = Array(s)
  var stack: [Character] = []

  for element in array {
    if stack.isEmpty { // First Case
      stack.append(element)
    } else {
      if stack.last! == element {
        stack.popLast()
      } else {
        stack.append(element)
      }
    }
  }

  if stack.isEmpty {
    return 1
  } else {
    return 0
  }
}