import Foundation

class FileIO {
  @inline(__always) private var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()) + [0], byteIdx = 0

  @inline(__always) private func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    return buffer.withUnsafeBufferPointer { $0[byteIdx] }
  }

  @inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
  }

  @inline(__always) func readStirngSum() -> Int {
    var byte = readByte()
    while byte == 10 || byte == 32 { byte = readByte() }
    var sum = Int(byte)
    while byte != 10 && byte != 32 && byte != 0 { byte = readByte(); sum += Int(byte) }
    return sum - Int(byte)
  }

  @inline(__always) private func write(_ output: String) {
    FileHandle.standardOutput.write(output.data(using: .utf8)!)
  }
}

var file = FileIO()
let n = file.readInt()
var nums: [Int] = [-1]
for _ in 1...n {
  nums.append(file.readInt())
}
let m = file.readInt()
var questions: [(Int, Int)] = []
var answer = ""

for _ in 1...m {
  let (s, e) = (file.readInt(), file.readInt())
  questions.append((s, e))
}

var d: [[Bool]] = .init(repeating: .init(repeating: false, count: n + 1), count: n + 1)

for i in 1...n {
  d[i][i] = true
}

if n >= 3 {
  for i in 1...n - 1 {
    if nums[i] == nums[i + 1] { d[i][i + 1] = true }
  }

  for k in 3...n {
    for i in 1...n - k + 1 {
      let index = i + k - 1
      if nums[i] == nums[index] && d[i + 1][index - 1] {
        d[i][index] = true
      }
    }
  }

  for question in questions {
    if d[question.0][question.1] { answer += "1\n" }
    else { answer += "0\n" }
  }
} else if n == 2 {
  if nums[1] == nums[2] { d[1][2] = true }
  for question in questions {
    if d[question.0][question.1] { answer += "1\n" }
    else { answer += "0\n" }
  }
} else {
  answer += "1"
}

print(answer)