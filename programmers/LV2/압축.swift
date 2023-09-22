// MARK: - 단순구현

func solution(_ msg: String) -> [Int] {
    var dic: [String: Int] = [:]
    var dicIndex = 0
    
    let alphabet = "abcdefghijklmnopqrstuvwxyz".uppercased().map { String($0) }
    for alpha in alphabet {
        dicIndex += 1
        dic[alpha] = dicIndex
    }
    
    var wIndex = 0
    var cIndex = 0
    var msgArr = msg.map { String($0) }
    var answer: [Int] = []
    
    while true {
        if wIndex > msgArr.count - 1 || cIndex > msgArr.count - 1 { break }
        
        while true {
            if let _ = dic[getSum(msgArr, wIndex, cIndex)] {
                cIndex += 1
            } else {
                dicIndex += 1
                dic[getSum(msgArr, wIndex, cIndex)] = dicIndex
                answer.append(dic[getSum(msgArr, wIndex, cIndex - 1)]!)
                wIndex = cIndex
                
            }
            if cIndex >= msgArr.count - 1 { break }
        }
    }
    
    if cIndex != wIndex {
        answer.append(dic[getSum(msgArr, wIndex, cIndex - 1)]!)
    }
    
    return answer
}

func getSum(_ str: [String], _ w: Int, _ c: Int) -> String {
    var sum = ""
    for i in w...c {
        sum += str[i]
    }
    return sum
}