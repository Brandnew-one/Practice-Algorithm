import Foundation

// 개인적으로 너무 지저분하게 푼것 같다.. 단순 구현말고 뭔가 더 좋은 풀이가 있을지 고민해봐야 한다!!
// 나중에 다시 풀어볼것

var arr: [[Int]] = []
var dy: Int = 0
var dx: Int = 0

func makeNumber(_ index: Int, _ lastNumber: Int) -> [Int] {
  var numbers: [Int] = []
  for i in lastNumber + 1...lastNumber + index {
    numbers.append(i)
  }
  return numbers
}

func fillArr(_ dir: Int, _ numbers: [Int]) {
  if dir % 3 == 0 { // Up
    dy -= 1
    dx -= 1
    for number in numbers {
      arr[dy][dx] = number
      dy -= 1
      dx -= 1
    }
    dy += 1
    dx += 1
  } else if dir % 3 == 1 { // Down
    if dy != 0 && dx != 0 {
      dy += 1
    }
    for number in numbers {
      arr[dy][dx] = number
      dy += 1
    }
    dy -= 1
  } else { // Right
    dx += 1
    for number in numbers {
      arr[dy][dx] = number
      dx += 1
    }
    dx -= 1
  }
}

func solution(_ n: Int) -> [Int] {
  var dir = 1
  var index = n
  var lastNumber = 0
  for i in 1...n {
    let temp = [Int](repeating: 0, count: i)
    arr.append(temp)
  }
  while index > 0 {
    let numbers = makeNumber(index, lastNumber)
    fillArr(dir, numbers)
    lastNumber = numbers.last!
    dir += 1
    index -= 1
  }

  var answer: [Int] = []
  for items in arr {
    for item in items {
      answer.append(item)
    }
  }

  return answer
}