import Foundation

// MARK: - 나중에 다시 풀어볼것

typealias Count = (dia: Int, iron: Int, stone: Int)

func solution(
  _ picks:[Int],
  _ minerals:[String]
) -> Int {
  var pick: [Int] = picks
  var answer = 0
  var countArr: [Count] = []
  let fatigue: [[Int]] = [
    [1, 1, 1], // dia
    [5, 1, 1], // iron
    [25, 5, 1] // stone
  ]
  let pickCount = pick.reduce(0) { $0 + $1 * 5 }

  for i in stride(from: 0, to: minerals.count, by: 5) {
    var count: Count = (0, 0, 0)
    for j in 0..<5 {
      if i + j >= minerals.count { continue }
      if i + j >= pickCount { continue }
      switch minerals[i + j] {
      case "diamond":
        count.dia += 1
      case "iron":
        count.iron += 1
      case "stone":
        count.stone += 1
      default:
        continue
      }
    }
    countArr.append(count)
  }

  countArr.sort {
    if $0.dia == $1.dia {
      if $0.iron == $1.iron {
        return $0.stone > $1.stone
      } else {
        return $0.iron > $1.iron
      }
    } else {
      return $0.dia > $1.dia
    }
  }

  countArr.forEach {
    if pick[0] > 0 {
      answer += $0.dia * fatigue[0][0]
      answer += $0.iron * fatigue[0][1]
      answer += $0.stone * fatigue[0][2]
      pick[0] -= 1
    } else if pick[1] > 0 {
      answer += $0.dia * fatigue[1][0]
      answer += $0.iron * fatigue[1][1]
      answer += $0.stone * fatigue[1][2]
      pick[1] -= 1
    } else if pick[2] > 0 {
      answer += $0.dia * fatigue[2][0]
      answer += $0.iron * fatigue[2][1]
      answer += $0.stone * fatigue[2][2]
      pick[2] -= 1
    }
  }

  return answer
}