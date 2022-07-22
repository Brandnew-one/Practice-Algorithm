import Foundation

// 단순한 시뮬레이션 문제 -> (from, to) 정보를 들고 있어야 하는데 좀 더 깔끔하게 풀수는 없을까?
// 처음에는 typealias를 통해서 Dictionary의 키값으로 사용하려고 했는데 Hashable 프로토콜을 적용시킬 수 없어서 String으로 변경

enum Direction: String {
    case U
    case D
    case R
    case L
}

var answer: Int = 0
var y: Int = 0
var x: Int = 0
var dic: [String: Int] = [:]

func makeKey(_ fromY: Int, _ fromX: Int, _ toY: Int, _ toX: Int) -> String {
    return String(fromY) + String(fromX) + String(toY) + String(toX)
}

func move(_ dir: Direction) {
    switch dir {
    case .U: 
        if y < 5 {
            let key1 = makeKey(y, x, y + 1, x)
            let key2 = makeKey(y + 1, x, y, x)
            if dic[key1] == nil {
                answer += 1
                dic[key1] = 1
                dic[key2] = 1
            }
            y += 1
        }
    case .D:
        if y > -5 {
            let key1 = makeKey(y, x, y - 1, x)
            let key2 = makeKey(y - 1, x, y, x)
            if dic[key1] == nil {
                answer += 1
                dic[key1] = 1
                dic[key2] = 1
            }
            y -= 1
        }
    case .R:
        if x < 5 {
            let key1 = makeKey(y, x, y, x + 1)
            let key2 = makeKey(y, x + 1, y, x)
            if dic[key1] == nil {
                answer += 1
                dic[key1] = 1
                dic[key2] = 1
            }
            x += 1
        }
    case .L:
        if x > -5 {
            let key1 = makeKey(y, x, y, x - 1)
            let key2 = makeKey(y, x - 1, y, x)
            if dic[key1] == nil {
                answer += 1
                dic[key1] = 1
                dic[key2] = 1
            }
            x -= 1
        }
    }
}

func solution(_ dirs: String) -> Int {
    let dirArr = dirs.map { Direction(rawValue: String($0))! }
    for dir in dirArr {
        move(dir)
    }
    return answer
}