import Foundation

typealias Plan = (String, Int, Int)

func transMin(_ plan: [String]) -> Plan {
    let time: [String] = plan[1].map { String($0) }
    let hour = Int(time[0] + time[1])! * 60
    let min = Int(time[3] + time[4])!
    let playtime = Int(plan[2])!
    
    return(plan[0], hour + min, playtime)
}

func solution(_ plans: [[String]]) -> [String] {
    var minPlans = plans.map { transMin($0) }.sorted { $0.1 > $1.1 }    
    var answer: [String] = []
    
    var suspend: [Plan] = []
    var onProgress = minPlans.popLast()!
    while !minPlans.isEmpty {
        var todo = minPlans.popLast()!        
        if onProgress.1 + onProgress.2 == todo.1 { // 과제 종료 시작시간이 동일한 경우
            answer.append(onProgress.0)
            onProgress = todo
        } else if onProgress.1 + onProgress.2 < todo.1 { // 과제 종료 후 시간이 남는 경우
            if suspend.isEmpty { // 멈춘 과제가 없는 경우
                answer.append(onProgress.0)
                onProgress = todo
            } else { // 멈춘 과제가 있는 경우
                answer.append(onProgress.0)
                var lastSus = suspend.popLast()! // 멈춘과제 다시 시작
                lastSus.1 = onProgress.1 + onProgress.2 // 시작시간 변경
                onProgress = lastSus
                minPlans.append(todo)
            }
        } else { // 과제 종료 시간 전 새롭게 시작하는 과제가 있는 경우
            onProgress.2 = onProgress.1 + onProgress.2 - todo.1
            suspend.append(onProgress)
            onProgress = todo
        }
    }
    
    answer.append(onProgress.0)
    while !suspend.isEmpty {
        answer.append(suspend.popLast()!.0)
    }
    return answer
}