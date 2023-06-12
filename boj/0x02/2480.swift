import Foundation

var inputArr: [Int] = Array(repeating: 0, count: 7)
var max: Int = 0
var flag: Bool = false
let input = readLine()!.split { $0 == " " }.map { Int($0)! }

for i in input {
    inputArr[i] += 1
}

for i in 1..<inputArr.count {
    if inputArr[i] == 3 {
        print(10000 + i * 1000)
        flag = true
        break
    } else if inputArr[i] == 2 {
        print(1000 + i * 100)
        flag = true
        break
    } else if inputArr[i] == 1 {
        max = i
    }
}

if !flag {
    print(max * 100)
}
