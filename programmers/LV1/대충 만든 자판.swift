func solution(
  _ keymap: [String],
  _ targets: [String]
) -> [Int] {
  var countDic: [String: Int] = [:]
  var answer: [Int] = []
  for key in keymap {
    let strArr = key.map { String($0) }
    for i in 0..<strArr.count {
      if let count = countDic[strArr[i]] {
        if count > i {
          countDic[strArr[i]] = i + 1
        }
      } else {
        countDic[strArr[i]] = i + 1
      }
    }
  }

  for target in targets {
    let strArr = target.map { String($0) }
    var tempAnswer: Int = 0
    for str in strArr {
      if let count = countDic[str] {
        tempAnswer += count
      } else {
        tempAnswer = -1
        break
      }
    }
    answer.append(tempAnswer)
  }

  return answer
}
