import Foundation

var s = readLine()!.map { String($0) }
var t = readLine()!.map { String($0) }
var answer = 0

dfs(t)
print(answer)

@discardableResult
func dfs(_ str: [String]) -> [String] {
  if str.count == s.count && str == s {
    answer = 1
  }
  if str.count < s.count { return [] }

  if str.last! == "A" {
    var temp = str
    temp.removeLast()
    dfs(temp)
  }

  if str.first! == "B" {
    var temp = str
    temp.reverse()
    temp.removeLast()
    dfs(temp)
  }

  return []
}