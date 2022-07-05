import Foundation

// O(N)의 시간복잡도로 해결할 수 있다. -> 해쉬맵을 이용한 딕셔너리를 이용해 이전에 사용된 단어를 확인했다.

func solution(_ n: Int, _ words: [String]) -> [Int] {
    var dic: [String: Int] = [:]
    dic[words[0]] = 0
    for i in 1...words.count - 1 {
        let lastword = words[i - 1].last!
        let firstword = words[i].first!
        if lastword != firstword || dic[words[i]] != nil {
            return [i % n + 1, i / n + 1]
        } else {
            dic[words[i]] = i
        }
    }
    
    return [0, 0]
}