import Foundation

let t = Int(readLine()!)!
var tc: [Int] = []
for _ in 1...t {
  let input = Int(readLine()!)!
  tc.append(input)
}

var d: [[Int]] = .init(repeating: .init(repeating: 0, count: 4), count: tc.max()! + 2)
d[1][1] = 1
d[2][1] = 1
d[2][2] = 1
d[3][1] = 1
d[3][2] = 1
d[3][3] = 1

for i in 4...tc.max()! {
  d[i][1] = 1
  d[i][2] = d[i - 2][2] + d[i - 2][1]
  d[i][3] = d[i - 3][3] + d[i - 3][2] + d[i - 3][1]
}

var answer = ""
for t in tc {
  answer += "\(d[t][1] + d[t][2] + d[t][3])" + "\n"
}

print(answer)