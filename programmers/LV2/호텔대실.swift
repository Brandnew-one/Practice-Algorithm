import Foundation

/*
    /// 1) 시작, 종료 시간별로 정렬
    /// 2) 방 배열을 만들고 해당방에 예약을 잡을 수 있는지 확인
    O(N^2)으로 풀이가 가능하기 때문에 가능한 풀이임. -> O(1440 * N)으로도 풀 수 있음
*/

func check(_ time: [String], _ rooms: [[String]]) -> Int? {
    for i in 0..<rooms.count {
        let room = rooms[i]
        if timeCheck(room.last!, time[0]) {
            return i
        }
    }
    return nil
}


// 청소시간을 추가했을 때, 가능한지?
func timeCheck(_ time1: String, _ time2: String) ->  Bool {
    let exitTime = time1.map { String($0) }
    var hour = Int(exitTime[0] + exitTime[1])!
    var min = Int(exitTime[3] + exitTime[4])!
    
    if min >= 50 {
        min += 10
        min %= 60
        hour += 1
    } else {
        min += 10
    }
    
    var time: String = ""
    if hour < 10 {
        time += "0"
    }
    
    if min < 10 {
        time += String(hour) + ":0" + String(min)
    } else {
        time += String(hour) + ":" + String(min)
    }
    
    // print("이전: ", time1, "이후: ", time)
    return time <= time2
}

func solution(_ book_time: [[String]]) -> Int {
    let sortedTime: [[String]] = book_time.sorted {
        if $0[0] == $1[0] {
            return $0[1] < $1[1]
        } else {
            return $0[0] < $1[0]
        }
    }
    
    var rooms: [[String]] = []
    rooms.append(sortedTime[0])
    
    for i in 1..<sortedTime.count {
        if let roomNumber = check(sortedTime[i], rooms) {
            rooms[roomNumber].append(sortedTime[i][0])
            rooms[roomNumber].append(sortedTime[i][1])
        } else {
            rooms.append(sortedTime[i])
        }
    }
    
    return rooms.count
}