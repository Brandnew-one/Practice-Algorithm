import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    let r = a % b
    if r == 0 {
        return b
    }
    return gcd(b, r)
}

func arrayGCD(_ array: [Int]) -> Int {
    let arr = array.sorted { $0 > $1 }
    if arr.count == 1 {
      return arr[0]  
    } else if arr.count == 2 {
        return gcd(arr[0], arr[1])
    } else {
        var temp = gcd(arr[0], arr[1])
        for i in 2..<arr.count {
            if temp >= arr[i] {
                temp = gcd(temp, arr[i])
            } else {
                temp = gcd(arr[i], temp)
            }
        }
        return temp
    }
}

func check(_ arr: [Int], _ gcd: Int) -> Bool {
    if gcd == 1 { return false }
    for a in arr {
        if a % gcd == 0 { return false }
    }
    return true
}

func solution(_ arrayA: [Int], _ arrayB: [Int]) -> Int {
    let gcdA = arrayGCD(arrayA)
    let gcdB = arrayGCD(arrayB)
    
    if gcdA > gcdB {
        if check(arrayB, gcdA) {
            return gcdA
        } else {
            return 0
        }
    } else {
        if check(arrayA, gcdB) {
            return gcdB
        } else {
            return 0
        }
    }
}