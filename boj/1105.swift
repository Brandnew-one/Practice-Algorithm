import Foundation

final class FileIO {
  private var buffer:[UInt8]
  private var index: Int

  init(fileHandle: FileHandle = FileHandle.standardInput) {
    buffer = Array(fileHandle.readDataToEndOfFile())+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    index = 0
  }

  @inline(__always) private func read() -> UInt8 {
    defer { index += 1 }

    return buffer.withUnsafeBufferPointer { $0[index] }
  }

  @inline(__always) func readInt() -> Int {
    var sum = 0
    var now = read()
    var isPositive = true

    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시
    if now == 45{ isPositive.toggle(); now = read() } // 음수 처리
    while now >= 48, now <= 57 {
      sum = sum * 10 + Int(now-48)
      now = read()
    }

    return sum * (isPositive ? 1:-1)
  }

  @inline(__always) func readString() -> String {
    var str = ""
    var now = read()

    while now == 10
            || now == 32 { now = read() } // 공백과 줄바꿈 무시

    while now != 10
            && now != 32 && now != 0 {
      str += String(bytes: [now], encoding: .ascii)!
      now = read()
    }

    return str
  }
}


let fileIO = FileIO()
let t = fileIO.readInt()
var answer = ""

for _ in 1...t {
  let n = fileIO.readInt(), k = fileIO.readInt()
  var costs: [Int] = []
  for _ in 1...n {
    costs.append(fileIO.readInt())
  }

  var adj: [[Int]] = .init(repeating: [], count: n + 1)
  var indgree: [Int] = .init(repeating: 0, count: n + 1)

  for _ in 1...k {
    let cur = fileIO.readInt(), next = fileIO.readInt()
    adj[cur].append(next)
    indgree[next] += 1
  }

  let destination = fileIO.readInt()

  var stack: [Int] = []
  var ans = 0

  for i in 1...n {
    if indgree[i] == 0 {
      stack.append(i)
    }
  }

  while !stack.isEmpty {
    var min = Int.max, minIndex = -1
    for i in 0..<stack.count {
      if min > costs[stack[i] - 1] {
        min = costs[stack[i] - 1]
        minIndex = i
      }
    }

    for i in 0..<stack.count {
      costs[stack[i] - 1] -= min
    }

    let cur = stack.remove(at: minIndex)
    ans += min
    if cur == destination { break }

    for next in adj[cur] {
      indgree[next] -= 1
      if indgree[next] == 0 {
        stack.append(next)
      }
    }
  }
  answer += "\(ans)\n"
}
print(answer)
