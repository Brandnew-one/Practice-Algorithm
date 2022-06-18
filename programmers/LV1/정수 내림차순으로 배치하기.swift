import Foundation

func solution(_ n: Int64) -> Int64 {
    var answer = ""
    var s = String(n).sorted { $0 > $1 }
    s.forEach { answer += String($0) }
    return Int64(answer)!
}