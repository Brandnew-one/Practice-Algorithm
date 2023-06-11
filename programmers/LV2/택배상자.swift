import Foundation

/// 전형적인 Stack 문제인데 너무 대충 풀었다.. 코드 좀 다듬어야 한다

func solution(_ order: [Int]) -> Int {
  var answer: Int = 0
  var mainBelt: [Int] = []
  var subBelt: [Int] = []


  for i in (1...order.count).reversed() {
    mainBelt.append(i)
  }

  for o in order {
    if let _ = mainBelt.last {
      if mainBelt.last! < o {
        while mainBelt.last! != o {
          subBelt.append(mainBelt.last!)
          mainBelt.popLast()
        }
        answer += 1
        mainBelt.popLast()
      } else if mainBelt.last! == o {
        answer += 1
        mainBelt.popLast()
      } else {
        if let sub = subBelt.last {
          if sub == o {
            answer += 1
            subBelt.popLast()
          } else { break }
        } else { break }
      }
    } else {
      if let sub = subBelt.last {
        if sub == o {
          answer += 1
          subBelt.popLast()
        } else { break }
      } else { break }
    }
  }

  return answer
}