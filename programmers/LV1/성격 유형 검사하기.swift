import Foundation

var dic: [String: Int] = [:]
let score = [3, 2, 1, 0, 1, 2, 3]

func setup() {
    dic["R"] = 0
    dic["T"] = 0
    
    dic["C"] = 0
    dic["F"] = 0
    
    dic["J"] = 0
    dic["M"] = 0
    
    dic["A"] = 0
    dic["N"] = 0
}

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var answer = ""
    setup()
    for i in 0..<survey.count {
        let component = survey[i].map { String($0) }
        if choices[i] > 4 {
            dic[component[1]]! += score[choices[i] - 1]
        } else {
            dic[component[0]]! += score[choices[i] - 1]
        }
    }
    answer += dic["R"]! >= dic["T"]! ? "R" : "T"
    answer += dic["C"]! >= dic["F"]! ? "C" : "F"
    answer += dic["J"]! >= dic["M"]! ? "J" : "M"
    answer += dic["A"]! >= dic["N"]! ? "A" : "N"
    return answer
}