import Foundation

// 홀수일 때는 0101 -> 0110 LSB부터 0이 되는 순간을 찾아서 해당 비트를 1로 바꾸고 이전 비트를 0으로 바꿔주면 된다!
// String subscript로 접근해서 값을 바꿔줄 수는 없다! -> Charactor 타입의 배열로 바꿔서 바꾸고 다시 String으로 바꾸자!

func isEven(_ number: Int64) -> Bool {
    return number % 2 == 0
}

func check(_ number: Int64) -> Int64 {
    if isEven(number) {
        return number + 1
    } else {
        var binary = String(number, radix: 2)
        binary.insert("0", at: binary.startIndex)
        var index = binary.count - 1
        while true {
            let value = binary[binary.index(binary.startIndex, offsetBy: index)]
            if value == "0" {
                var answer = binary.map { $0 }
                answer[index] = "1"
                answer[index + 1] = "0"
                return Int64(String(answer), radix: 2)!
            }
            index -= 1
        }
    }
}

func solution(_ numbers:[Int64]) -> [Int64] {
    return numbers.map { check($0) }
}


// 시간 초과가 발생한 코드
// 짝수는 항상 + 1, 홀수인 경우의 규칙을 발견하지 못해서 + 1 씩 증가시키면서 조건을 만족하는 값을 찾도록 설정
// 1 ≤ numbers의 길이 ≤ 100,000, 0 ≤ numbers의 모든 수 ≤ 10^15

func isEven(_ number: Int64) -> Bool {
    return number % 2 == 0
}

func find(_ number: Int64) -> Int64 {
    var num: Int64 = number + 1
    while true {
        var count: Int = 0
        var ref = String(number, radix: 2)
        var binary = String(num, radix: 2)
        if ref.count != binary.count {
            for i in 0..<binary.count - ref.count {
                ref.insert("0", at: ref.startIndex)
            }
        }
        for i in 0..<ref.count {
            let refC = ref[ref.index(ref.startIndex, offsetBy: i)]
            let binaryC = binary[binary.index(binary.startIndex, offsetBy: i)]
            if refC != binaryC {
                count += 1
            }
            if count > 2 { break }
        }
        if count <= 2 {
            return num
        }
        num += 1
    }
}

func check(_ number: Int64) -> Int64 {
    if isEven(number) {
        return number + 1
    } else {
        return find(number)
    }
}

func solution(_ numbers:[Int64]) -> [Int64] {
    return numbers.map { check($0) }
}

