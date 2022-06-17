import Foundation

/// 문제 자체보다는 Swift에서 슬라이싱을 사용하면서 배운것들
/// 1) Array를 슬라이싱 한 결과값은 Array 타입이 아님
/// 2) Array를 슬라이싱 한 결과값의 첫번째 인덱스는 0임이 보장되지 않음 -> startIndex 사용해야 함
/// 3) 해당문제는 아니지만 단순히 for문을 도는것 보다 슬라이싱의 속도가 더 느림

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
  var answer: [Int] = []
  for command in commands {
    var tempArray = array[command[0] - 1..<command[1]]
    tempArray.sort(by: { $0 < $1 })
    answer.append(tempArray[tempArray.startIndex + command[2] - 1])
  }
  return answer
}

// MARK: - 참고할만한 풀이
func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
  return commands.map({(key) in
    return array[(key[0]-1)...(key[1]-1)].sorted()[key[2]-1]
    })
}
