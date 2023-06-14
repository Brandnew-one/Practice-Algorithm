import Foundation

typealias Coordinate = (y: Int, x: Int)

var boardArr: [[String]] = []
let coordinates: [[Coordinate]] = [
    [(0, 0), (0, 1), (0, 2)],
    [(1, 0), (1, 1), (1, 2)],
    [(2, 0), (2, 1), (2, 2)],
    [(0, 0), (1, 0), (2, 0)],
    [(0, 1), (1, 1), (2, 1)],
    [(0, 2), (1, 2), (2, 2)],
    [(0, 0), (1, 1), (2, 2)],
    [(2, 0), (1, 1), (0, 2)],
]

func compO(_ board: [String]) -> Bool {
    (board[0] == board[1] && board[1] == board[2]) && board[0] == "O"
}

func compX(_ board: [String]) -> Bool {
    (board[0] == board[1] && board[1] == board[2]) && board[0] == "X"
}

func solution(_ board: [String]) -> Int {
    boardArr = board.map { $0.map { String($0) } }    
    var oCount: Int = 0
    var xCount: Int = 0
    
    for y in 0..<3 {
        for x in 0..<3 {
            if boardArr[y][x] == "O" {
                oCount += 1
            }
            if boardArr[y][x] == "X" {
                xCount += 1
            }
        }
    }

    if xCount > oCount {
        return 0
    } else if oCount == xCount {
        // o가 이겼는데 x를 둔 경우
        for coordinate in coordinates {
            let board = coordinate.map { boardArr[$0.y][$0.x] }
            if compO(board) { return 0 }
        }
        return 1
    } else if oCount >= xCount + 2 {
        return 0
    } else if oCount == xCount + 1 {
        for coordinate in coordinates {
            let board = coordinate.map { boardArr[$0.y][$0.x] }
            if compX(board) { return 0 }
        }
        return 1
    } else {
        return 1
    }    
}