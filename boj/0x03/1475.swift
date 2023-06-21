import Foundation

var answer = 0
var dArr = Array(repeating: 0, count: 10)
let nArr = readLine()!.map { String($0) }

for n in nArr {
    dArr[Int(n)!] += 1
}

dArr[6] = dArr[6] + dArr[9]
dArr[9] = 0
if dArr[6] % 2 == 0 {
    dArr[6] = dArr[6] / 2
} else {
    dArr[6] = dArr[6] / 2 + 1
}

for d in dArr {
    if d >= answer { answer = d }
}

print(answer)
