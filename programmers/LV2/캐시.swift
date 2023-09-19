// MARK: - LRU 알고리즘이 어떻게 동작하는지 알고 있는지?
/// 시간복잡도가 널널해서 단순히 구현만 하면 해결할 수 있는 문제

func solution(_ cacheSize: Int, _ cities: [String]) -> Int {
    var time = 0

    var cacheData: [String] = []
    var cache: [String: Bool] = [:]
    
    for city in cities.map { $0.lowercased() } {
        if lru(&cache, &cacheData, cacheSize, city) {
            time += 1
        } else {
            time += 5
        }
    }
    
    return time
}

func lru(_ cache: inout [String: Bool], 
         _ cacheData: inout [String], 
         _ cacheSize: Int,
         _ city: String) -> Bool {
    guard cacheSize > 0 else { return false }
    // Hit
    if let _ = cache[city] {
        let index = cacheData.firstIndex(of: city)!
        cacheData.remove(at: index)
        cacheData.append(city)
        return true
    // Miss
    } else {
        if cacheData.count >= cacheSize {
            let lastUsed = cacheData[0]
            cache.removeValue(forKey: lastUsed)
            
            cacheData.removeFirst()
            cacheData.append(city)
            cache[city] = true
        } else {
            cacheData.append(city)
            cache[city] = true
        }
        return false
    }
}