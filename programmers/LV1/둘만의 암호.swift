import Foundation

extension String {
  var asciiType: Int {
    Int(UnicodeScalar(self)!.value)
  }
}

func solution(
  _ s: String,
  _ skip: String,
  _ index: Int
) -> String {
  let skip2Ascii = skip.map { String($0).asciiType }
  var answer = ""

  s.forEach {
    var ascii = String($0).asciiType
    var i = 0

    while true {
      ascii += 1
      if ascii > 122 { ascii = 97 }
      if !skip2Ascii.contains(ascii) {
        i += 1
      }
      if i == index { break }
    }
    answer += String(UnicodeScalar(ascii)!)
  }

  return answer
}