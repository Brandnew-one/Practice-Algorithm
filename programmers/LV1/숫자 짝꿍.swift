import Foundation

func solution(
  _ X: String,
  _ Y: String
) -> String {
  var xArr: [Int] = Array(repeating: 0, count: 10)
  var yArr: [Int] = Array(repeating: 0, count: 10)
  var temp: [Int] = Array(repeating: 0, count: 10)
  var answer: String = ""
  let xStr = X.map { String($0) }
  let yStr = Y.map { String($0) }

  xStr.forEach {
    if let intValue = Int($0) {
      xArr[intValue] += 1
    }
  }

  yStr.forEach {
    if let intValue = Int($0) {
      yArr[intValue] += 1
    }
  }

  for i in 0...9 {
    if xArr[i] >= yArr[i] {
      temp[i] = yArr[i]
    } else {
      temp[i] = xArr[i]
    }
  }

  for i in stride(from: 9, through: 0, by: -1) {
    let refString = String(i)
    for _ in 0..<temp[i] {
      answer += refString
    }
  }

  if answer == "" {
    return "-1"
  }

  if let frist = answer.first {
    if frist == "0" {
      return "0"
    }
  }

  return answer
}
