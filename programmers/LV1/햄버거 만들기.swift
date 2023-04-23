import Foundation

// MARK: - Stack
func solution(
  _ ingredients: [Int]
) -> Int {
  var answer = 0
  var temp: [Int] = []

  for ingredient in ingredients {
    temp.append(ingredient)

    let count = temp.count
    if count < 4 { continue }

    if temp[count - 4] == 1 &&
        temp[count - 3] == 2 &&
        temp[count - 2] == 3 &&
        temp[count - 1] == 1 {
      answer += 1
      temp.removeLast(4)
    }
  }

  return answer
}