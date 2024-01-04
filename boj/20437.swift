import Foundation

// TODO: - O(N^2)에 가까운 풀이, 시간초과 나야하지 않을까?

let t = Int(readLine()!)!

for _ in 1...t {
  var alphabet: [Int] = .init(repeating: 0, count: 26)
  let w = readLine()!.map { String($0) }
  let k = Int(readLine()!)!
  
  var minLen = 10001
  var maxLen = -1

  for s in w {
    alphabet[Int(Character(s).asciiValue! - Character("a").asciiValue!)] += 1
  }

  var possible = false
  for i in 0..<26 {
    if alphabet[i] >= k { possible = true }
  }

  if possible {
    if k == 1 {
      print("1 1")
    } else {
      for i in 0..<w.count {
        if alphabet[Int(Character(w[i]).asciiValue! - Character("a").asciiValue!)] < k { continue }
        var cnt = 1
        for j in i + 1..<w.count {
          if w[j] == w[i] { cnt += 1 }
          if cnt == k {
            let len = j - i + 1
            maxLen = max(maxLen, len)
            minLen = min(minLen, len)
            break
          }
        }
      }
      print(minLen, maxLen)
    }
  } else {
    print("-1")
  }
}
