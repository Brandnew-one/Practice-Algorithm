import Foundation

typealias Position = (y: Int, x: Int)

public struct Queue<T> {
    fileprivate var array = [T?]()
    fileprivate var head = 0
    
    public var isEmpty: Bool {
        return count == 0
    }
    
    public var count: Int {
        return array.count - head
    }
    
    public mutating func enqueue(_ element: T) {
        array.append(element)
    }
    
    public mutating func dequeue() -> T? {
        guard head < array.count, let element = array[head] else { return nil }
        
        array[head] = nil
        head += 1
        
        let percentage = Double(head) / Double(array.count)
        if array.count > 50 && percentage > 0.25 {
            array.removeFirst(head)
            head = 0
        }
        
        return element
    }
}

enum Dir: CaseIterable {
    case up
    case down
    case left
    case right
}

var boardArr: [[String]] = []

func move(_ dir: Dir, _ start: Position) -> Position {
    var position = start
    
    switch dir {
    case .up:
        if position.y == 0 { return position }
        while boardArr[position.y][position.x] != "D" {
            if position.y <= 0 { break }
            position.y -= 1
        }
        if boardArr[position.y][position.x] == "D" && position.y == 0 {
            position.y += 1
        } else if position.y != 0  {
            position.y += 1
        }
        return position
    case .down:
        if position.y == boardArr.count - 1 { return position }
        while boardArr[position.y][position.x] != "D" {
            if position.y >= boardArr.count - 1 { break }
            position.y += 1
        }
        if boardArr[position.y][position.x] == "D" && position.y == boardArr.count - 1 {
            position.y -= 1
        } else if position.y != boardArr.count - 1 {
            position.y -= 1
        }
        return position
    case .left:
        if position.x == 0 { return position }
        while boardArr[position.y][position.x] != "D" {
            if position.x <= 0 { break }
            position.x -= 1
        }
        if boardArr[position.y][position.x] == "D" && position.x == 0 {
            position.x += 1
        } else if position.x != 0  {
            position.x += 1
        }
        return position
    case .right:
        if position.x == boardArr[0].count - 1 { return position }
        while boardArr[position.y][position.x] != "D" {
            if position.x >= boardArr[0].count - 1 { break }
            position.x += 1
        }
        if boardArr[position.y][position.x] == "D" && position.x == boardArr[0].count - 1 {
            position.x -= 1
        } else if position.x != boardArr[0].count - 1 {
            position.x -= 1
        }
        return position
    }
}

func solution(_ board: [String]) -> Int {
    boardArr = board.map { $0.map { String($0) } }
    
    var start: Position = (0, 0)
    var end: Position = (0, 0)
    for y in 0..<boardArr.count {
        for x in 0..<boardArr[0].count {
            if boardArr[y][x] == "R" {
                start = (y, x)
            }
            if boardArr[y][x] == "G" {
                end = (y, x) 
            }
        }
    }
    
    var vis: [[Int]] = Array(
        repeating: Array(repeating: -1, count: boardArr[0].count), 
        count: boardArr.count
    ) 
    var queue = Queue<Position>()
    
    queue.enqueue(start)
    vis[start.y][start.x] = 0
    
    while !queue.isEmpty {
        let cur = queue.dequeue()!
        
        for dir in Dir.allCases {
            let dPosition = move(dir, cur)
            let dy = dPosition.y
            let dx = dPosition.x
            
            if dy < 0 || dy >= boardArr.count || dx < 0 || dx >= boardArr[0].count { continue }
            if vis[dy][dx] != -1 { continue }
            
            queue.enqueue(dPosition)
            vis[dy][dx] = vis[cur.y][cur.x] + 1
        }
    }
    
    return vis[end.y][end.x]
}
