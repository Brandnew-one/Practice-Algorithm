import Foundation

// Swift에서 queue 야매로 다른 사람들 어떻게 구현하는지 확인 필요!

typealias Point = (y: Int, x: Int)
let d: [Point] = [(-1, 0), (1, 0), (0, -1), (0, 1)] // u, d, l, r

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

func bfs(_ map: [[String]], _ start: Point, _ end: Point) -> Int {
    var vis: [[Int]] = Array(
        repeating: Array(repeating: -1, count: map[0].count), 
        count: map.count
    )
    
    var q :Queue<Point> = Queue()
    q.enqueue(start)
    vis[start.y][start.x] = 0
    
    while !q.isEmpty {
        let cPosition = q.dequeue()!
        for dir in 0..<4 {
            let dy = cPosition.y + d[dir].y
            let dx = cPosition.x + d[dir].x
            
            if dy < 0 || dx < 0 || dy >= map.count || dx >= map[0].count { continue }
            if vis[dy][dx] != -1 { continue }
            if map[dy][dx] == "X" { continue }
            q.enqueue((dy, dx))
            vis[dy][dx] = vis[cPosition.y][cPosition.x] + 1
        }
    }
    
    return vis[end.y][end.x]
}


func solution(_ maps: [String]) -> Int {
    let map: [[String]] = maps.map { $0.map { String($0) } }
    var startPoint: Point = (0, 0)
    var leverPoint: Point = (0, 0)
    var endPoint: Point = (0, 0)
    
    for y in 0..<map.count {
        for x in 0..<map[0].count {
            if map[y][x] == "S" {
                startPoint = (y: y, x: x)
            }
            if map[y][x] == "L" {
                leverPoint = (y: y, x: x)
            }
            if map[y][x] == "E" {
                endPoint = (y: y, x: x)
            }
        }
    }
    
    let toLever = bfs(map, startPoint, leverPoint)
    let toEnd = bfs(map, leverPoint, endPoint)
    
    if toLever != -1 && toEnd != -1 {
        return toLever + toEnd
    } else {
        return -1
    }
}