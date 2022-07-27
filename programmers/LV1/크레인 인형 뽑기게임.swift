import Foundation

func solution(_ board: [[Int]], _ moves: [Int]) -> Int {
    var tempBoard: [[Int]] = board
    var resultBag: [Int] = []
    var answer: Int = 0
    
    for move in moves {
        for y in 0..<board.count {
            if tempBoard[y][move - 1] != 0 {
                tempBoard[y][move - 1] = 0
                if !resultBag.isEmpty {
                    if resultBag.last! == board[y][move - 1] {
                        resultBag.removeLast()
                        answer += 2
                    } else {
                        resultBag.append(board[y][move - 1])
                    }
                } else {
                    resultBag.append(board[y][move - 1])
                }
                break
            }
        }
    }
    
    return answer
}