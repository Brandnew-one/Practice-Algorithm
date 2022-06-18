import Foundation

// 이렇게 쉬운 문제를 이렇게 더럽게 짤 필요가 있을까?

func solution(_ s: String, _ n: Int) -> String {
  var answer: String = ""
  let upperAlpha: [String] = [
    "A", "B", "C", "D", "E", "F", "G", "H", "I",
    "J", "K", "L", "M", "N", "O", "P", "Q", "R",
    "S", "T", "U", "V", "W", "X", "Y", "Z"
  ]
  let lowerAlpha = upperAlpha.map { $0.lowercased() }

  for i in 0..<s.count {
    let splitString = String(s[s.index(s.startIndex, offsetBy: i)])
    if splitString == " " { // 공백은 공백
      answer += " "
    } else if upperAlpha.contains(splitString) { // 대문자인 경우
      var index = 0
      for i in 0..<upperAlpha.count {
        if upperAlpha[i] == splitString {
          index = i
          break
        }
      }
      index = (index + n) % upperAlpha.count
      answer += String(upperAlpha[index])
    } else { // 소문자인 경우
      var index = 0
      for i in 0..<lowerAlpha.count {
        if lowerAlpha[i] == splitString {
          index = i
          break
        }
      }
      index = (index + n) % lowerAlpha.count
      answer += String(lowerAlpha[index])
    }
  }

  return answer
}