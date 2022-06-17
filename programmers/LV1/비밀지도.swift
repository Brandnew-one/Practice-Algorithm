import Foundation

func makeN(_ n: Int, _ a: String) -> String {
  if a.count == n {
    return a
  } else {
    var temp: String = ""
    for _ in a.count..<n {
      temp += "0"
    }
    return temp + a
  }
}

func or(_ a: String, _ b: String) -> String {
  var answer = ""
  for i in 0..<a.count {
    let tempA = a[a.index(a.startIndex, offsetBy: i)]
    let tempB = b[b.index(b.startIndex, offsetBy: i)]
    if tempA == "1" || tempB == "1" {
      answer += "#"
    } else {
      answer += " "
    }
  }
  return answer
}

func solution(_ n: Int, _ arr1: [Int], _ arr2: [Int]) -> [String] {
  var answer: [String] = []
  for i in 0..<arr1.count {
    let a = makeN(n, String(arr1[i], radix: 2))
    let b = makeN(n, String(arr2[i], radix: 2))
    // print(a, b)
    answer.append(or(a, b))
  }

  return answer
}
