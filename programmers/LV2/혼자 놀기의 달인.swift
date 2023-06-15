import Foundation

var search: [Set<Int>] = []

func solution(_ cards: [Int]) -> Int {
    var answer: Int = 0
    var vis: [Bool] = Array(repeating: false, count: cards.count + 1)
    
    for i in 0..<cards.count {
        if !vis[i + 1] {
            var set: Set<Int> = []
            set.insert(i + 1)
            vis[i + 1] = true
            var nextIndex = cards[i]
            
            while true {
                if vis[nextIndex] { break }
                set.insert(nextIndex)
                vis[nextIndex] = true
                nextIndex = cards[nextIndex - 1]
            }
            search.append(set)
        } else {
            continue
        }
    }
    
    search.sort { $0.count > $1.count }
    
    if search.count >= 2 {
        return search[0].count * search[1].count
    } else {
        return 0
    }
}