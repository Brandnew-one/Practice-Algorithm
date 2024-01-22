import Foundation

// MARK: - 빗물
let input = readLine()!.split(separator: " ").map { Int($0)! }
let h = input[0], w = input[1]
let d = readLine()!.split(separator: " ").map { Int($0)! }

var lMax = -1, rMax = -1
var ans = 0
for i in 1..<w - 1 {
  lMax = (0..<i).map { d[$0] }.max()!
  rMax = (i + 1..<w).map { d[$0] }.max()!
  let rain = min(lMax, rMax) - d[i]
  if rain > 0 { ans += rain }
}

print(ans)