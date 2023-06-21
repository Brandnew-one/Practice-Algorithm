import Foundation

let n = Int(readLine()!)!
let arr = readLine()!.split { $0 == " " }.map { Int($0)! }
let x = Int(readLine()!)!

var d = Array(repeating: false, count: 2000002)

for a in arr {
    d[a] = true
}

var answer = 0
for a in arr {
    if a < x && d[x - a] { answer += 1 }
}

answer /= 2
print(answer)
