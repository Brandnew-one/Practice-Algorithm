import Foundation

/*
    swift로 출력할 때 [], {} 형태는 출력에서 제외시켜야 한다.
    즉, 배열이나 딕셔너리 자체를 출력하는게 아니라 순회하면서 출력해야 한다.
*/

var arr: [Int] = []
for i in 1...20 {
    arr.append(i)
}

for _ in 0..<10 {
    let input = readLine()!.split { $0 == " " }.map { Int($0)! }
    var tempArr: [Int] = []
    for index in input[0]...input[1] {
        tempArr.append(arr[index - 1])
    }

    for index in 0...(input[1] - input[0]) {
        arr[input[1] - index - 1] = tempArr[index]
    }
}

for a in arr {
  print(a, terminator: " ")
}