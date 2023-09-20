// MARK: - 중복을 허용하는 집합
/// 결국 필요한건 중복을 생각하지 않은 Set과 Set요소들이 등장한 count이기 때문에 Set, Dictionary를 통해 해결할 수 있음

func solution(_ str1: String, _ str2: String) -> Int {
    let dic1 = makeSet(str1.lowercased())
    let dic2 = makeSet(str2.lowercased())
    
    let set1 = Set(dic1.keys.map { String($0) })
    let set2 = Set(dic2.keys.map { String($0) })
    
    let intersection = Array(set1.intersection(set2)).reduce(0) { $0 + min(dic1[$1]!, dic2[$1]!) }
    let union = Array(set1.union(set2)).reduce(0) { 
        if set1.contains($1) && set2.contains($1) {
            return $0 + max(dic1[$1]!, dic2[$1]!)
        } else if set1.contains($1) && !set2.contains($1) {
            return $0 + dic1[$1]!
        } else {
            return $0 + dic2[$1]!
        }
    }
    
    if union == 0 {
        return 65536
    } else {
        return Int((Double(intersection) / Double(union)) * 65536)
    }
}

func makeSet(_ str: String) -> [String: Int] {
    var alphabetSet = Set<String>()
    let alphabet = "abcdefghijklmnopqrstuvwxyz".map { String($0) }.map { alphabetSet.insert($0) }
    let strArr = str.map { String($0) }
    var tempSet: [String] = []
    for i in 0..<strArr.count - 1 {
        if alphabetSet.contains(strArr[i]) && alphabetSet.contains(strArr[i + 1]) {
            let temp = strArr[i] + strArr[i + 1]
            tempSet.append(temp)
        }
    }
    var strSet: [String: Int] = [:]
    tempSet.sorted { $0 < $1 }.forEach {
        if let value = strSet[$0] {
            strSet[$0] = value + 1
        } else {
            strSet[$0] = 1
        }
    }
    
    return strSet
}