import Foundation

// 고차함수를 잘 활용하는 사람들의 풀이는 언제봐도 신기하다.. 확실히 익숙해질 필요가 있을것 같다
// return s.lowercased().filter { $0 == "p" }.count == s.lowercased().filter { $0 == "y" }.count

func solution(_ s: String) -> Bool {
    let arr = Array(s)
    var numberP: Int = 0
    var numberY: Int = 0
    
    arr.forEach {
        if $0 == "p" || $0 == "P" { numberP += 1 }
        if $0 == "y" || $0 == "Y" { numberY += 1 }
    }
    return numberP == numberY ? true: false
}