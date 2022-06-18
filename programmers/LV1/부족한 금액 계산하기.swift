import Foundation

func solution(_ price: Int, _ money: Int, _ count: Int) -> Int64{
    var answer: Int64 = 0
    for i in 1...count {
     answer += Int64(price) * Int64(i)   
    }
    
    return answer - Int64(money) > 0 ? answer - Int64(money) : 0
}