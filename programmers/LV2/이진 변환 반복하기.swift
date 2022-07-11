import Foundation

var binaryCount: Int = 0
var delCount: Int = 0

func binary(_ s: String) -> String {
    var delString = s.filter { 
        if $0 == "0"  {
            delCount += 1
            return false
        } else {
            return true
        }
    }
    binaryCount += 1
    return String(delString.count, radix: 2)
}


func solution(_ s: String) -> [Int] {
    var modifiedS = s
    while true {
        if modifiedS.count == 1 {
            break
        }
        modifiedS = binary(modifiedS)
    }
    return [binaryCount, delCount]
}