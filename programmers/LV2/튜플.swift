import Foundation

func solution(_ s: String) -> [Int] {
    var tempS = s
    tempS.removeLast()
    tempS.removeFirst()
    
    var splits = tempS.split(separator: "{")
    for i in 0..<splits.count {
        if(i == splits.count - 1) {
            splits[i].removeLast()
        } else {
            splits[i].removeLast(2)
        }
    }
    
    let arrS = splits.map { $0.split(separator: ",") }
    var dic: [Int: Int] = [:]
    
    for y in 0..<arrS.count {
        for x in 0..<arrS[y].count {
            if let _ = dic[Int(arrS[y][x])!] {
                dic[Int(arrS[y][x])!]! += 1
            } else {
                dic[Int(arrS[y][x])!] = 1
            }
        }
    }

    return dic.sorted { $0.value > $1.value }.map { $0.key }
}