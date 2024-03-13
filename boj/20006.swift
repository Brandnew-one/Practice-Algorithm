import Foundation

struct Room {
  var members: [Member]
  var min: Int
  var max: Int
}

struct Member {
  let level: Int
  let id: String
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let p = input[0], m = input[1]
var rooms: [Room] = []

for _ in 1...p {
  let input = readLine()!.split(separator: " ")
  let level = Int(input[0])!
  let id = String(input[1])

  var flag = false
  for i in 0..<rooms.count {
    if flag { break }
    if level < rooms[i].min || level > rooms[i].max { continue }
    if rooms[i].members.count >= m { continue }

    let member = Member(level: level, id: id)
    rooms[i].members.append(member)
    flag = true
  }

  if !flag {
    let member = Member(level: level, id: id)
    let room = Room(members: [member], min: level - 10, max: level + 10)
    rooms.append(room)
  }
}

var answer = ""
for room in rooms {
  if room.members.count == m {
    answer += "Started!\n"
  } else {
    answer += "Waiting!\n"
  }
  for member in room.members.sorted { $0.id < $1.id } {
    answer += "\(member.level) \(member.id)\n"
  }
}
print(answer)
