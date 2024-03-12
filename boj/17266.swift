import Foundation

let n = Int(readLine()!)!
let m = Int(readLine()!)!
let positions = readLine()!.split(separator: " ").map { Int($0)! }

var start = 1
var end = n
while true {
  if start > end { break }
  let mid = (start + end) / 2
  if checkLight(mid) {
    end = mid - 1
  } else {
    start = mid + 1
  }
}

print(start)

func checkLight(_ height: Int) -> Bool {
  var beforeIndex = 0
  for position in positions {
    if beforeIndex < position - height { return false }
    beforeIndex = position + height
  }
  return beforeIndex >= n
}
