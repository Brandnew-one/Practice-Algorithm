import Foundation

let n = Int(readLine()!)!
var inital = readLine()!.map { $0 == "1" ? true : false }
let final = readLine()!.map { $0 == "1" ? true : false }
let max = Int.max / 2

let offCase = check(inital)
inital[0] = !inital[0]
inital[1] = !inital[1]
let onCase = check(inital)

if offCase == max && onCase == max {
  print("-1")
} else {
  print(min(offCase, onCase + 1))
}

func check(_ arr: [Bool]) -> Int {
  var answer = 0, temp = arr
  for i in 1..<temp.count {
    if temp[i - 1] != final[i - 1] {
      for j in i - 1...i + 1 {
        if j == temp.count { continue }
        temp[j] = !temp[j]
      }
      answer += 1
    }
  }
  return temp == final ? answer : max
}