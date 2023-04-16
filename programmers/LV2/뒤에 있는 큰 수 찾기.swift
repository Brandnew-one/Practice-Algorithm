func solution(
  _ numbers: [Int]
) -> [Int] {
  var answer: [Int] = Array(repeating: -1, count: numbers.count)
  var stack: [(index: Int, value: Int)] = []
  stack.append((0, numbers[0]))

  for i in 1..<numbers.count {
    let value = numbers[i]
    if let vSet = stack.last,
       vSet.value < value
    {
      while true {
        if let stackValue = stack.last,
           stackValue.value < value
        {
          answer[stackValue.index] = value
          stack.removeLast()
        } else {
          stack.append((i, value))
          break
        }
      }
    } else {
      stack.append((i, value))
    }
  }

  return answer
}