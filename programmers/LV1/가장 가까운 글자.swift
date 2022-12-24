import Foundation

func solution(_ s: String) -> [Int] {
  let sArray = s.map { String($0) }
  var answer: [Int] = []
  var alphabet: [Int] = .init(repeating: -1, count: 26)

  for i in 0..<sArray.count {
    if let ascii = changeToAscii(sArray[i]),
       let ref = changeToAscii("a") {
      if alphabet[ascii - ref] == -1 {
        answer.append(-1)
      } else {
        answer.append(i - alphabet[ascii - ref])
      }
      alphabet[ascii - ref] = i
    }
  }

  return answer
}

func changeToAscii(_ s: String) -> Int? {
  if let ascii = UnicodeScalar(s)?.value {
    return Int(ascii)
  }
  return nil
}
