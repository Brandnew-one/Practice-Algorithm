import Foundation

// "최대공약수는 유클리드 호제법으로 풀면 가능!"은 기억이 나는데 유클리드 호제법을 까먹어서 찾아봤다..

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd(b, a % b)
    }
}

func lcm(_ a: Int, _ b: Int) -> Int {
    return a * b / gcd(a, b)
}

func solution(_ n: Int, _ m: Int) -> [Int] {
    return [gcd(n, m), lcm(n, m)]
}