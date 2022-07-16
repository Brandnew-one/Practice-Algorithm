import Foundation

// 진짜 Swift의 문자열 처리 지건 마렵다.
// String타입의 subscript는 Read-Only이므로 map을 통해서 배열로 만들어서 해결하자!

func solution(_ s: String) -> String {
  var stringList: [String] = s.components(separatedBy: " ")
  var answer = ""
  for i in 0..<stringList.count {
    if stringList[i].isEmpty {
      answer += " "
    } else {
      var str = stringList[i].map { $0.lowercased() }
      str[0] = str[0].uppercased()
      str.forEach {
        answer += $0
      }
      answer += " "
    }
  }
  answer.removeLast()
  return answer
}