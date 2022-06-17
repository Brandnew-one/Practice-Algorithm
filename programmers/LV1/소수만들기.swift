import Foundation

/// 모든 case를 살펴봐야 하는 문제이다. 하지만 순서에 따라 합의 결과는 바뀌지 않기 때문에 조합으로 접근해야 시간을 줄일 수 있다.
/// 50C3 으로 접근하기 위해 Swift에서 조합을 처음으로 짜봤다. 조금 더 보완이 필요할 것 같다.
/// 소수찾기 자체는 num아닌 root(num)까지 돌아서 시간을 더 줄일 수 있다. 

func isPrime(_ num: Int) -> Bool {
  if num == 1 { return false }
  else if num == 2 { return true }
  else {
    for i in 2..<num {
      if num % i == 0 { return false }
    }
    return true
  }
}

func combination(_ nums: [Int], _ k: Int) -> [[Int]] {
  var result = [[Int]]()
  var vis = [Bool](repeating: false, count: nums.count)

  func combi(_ index: Int, _ temp: [Int]) {
    if temp.count == k {
      result.append(temp)
      return
    }
    for i in index..<nums.count {
      if vis[i] { continue }
      vis[i] = true
      combi(i + 1, temp + [nums[i]])
      vis[i] = false
    }
  }
  combi(0, [])
  return result
}


func solution(_ nums:[Int]) -> Int {
  let results = combination(nums, 3)
  var answer = 0
  for result in results {
    let sum = result.reduce(0, +)
    if isPrime(sum) { answer += 1}
  }

  return answer
}

print(solution([1, 2, 3, 4]))
