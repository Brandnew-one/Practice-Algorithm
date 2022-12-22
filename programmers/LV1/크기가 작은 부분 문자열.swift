import Foundation

// 진짜 오랜만에 코테 문제를 풀어봤는데 p의 길이가 18이하로 Int로 표현할 수 없다는 제약 사항을 주의하면 쉽게 풀 수 있는 문제였다.
// 그럼에도 오랜만이라 삽질을 좀 했던것 같다. 다른 사람들의 풀이를 보니 [Int]로 compare를 좀 더 간단하게 하는게 괜찮은 아이디어 같다.
func solution(_ t: String, _ p: String) -> Int {
  let pLength = p.count
  let tArr = t.map { String($0) }

  var answer: Int = 0
  for i in 0...tArr.count - pLength {
    var tempString = ""
    for j in i..<i + pLength {
      tempString += tArr[j]
    }
    // print(tempString)
    if compare(tempString, p) { answer += 1 }
  }

  return answer
}

func compare(_ a: String, _ b: String) -> Bool {
  if a.first == "0" {
    return true
  }

  if a.count > b.count {
    return false
  } else if a.count < b.count {
    return true
  } else {
    let aArr = a.map { String($0) }
    let bArr = b.map { String($0) }
    for i in 0..<a.count {
      if aArr[i] < bArr[i] {
        return true
      }
      if aArr[i] > bArr[i] {
        return false
      }
    }
    return true
  }

}
