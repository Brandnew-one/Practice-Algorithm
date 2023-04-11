func solution(
  _ players: [String],
  _ callings: [String]
) -> [String] {
  var dic: [String: Int] = [:]
  var players = players
  for i in 0..<players.count {
    dic[players[i]] = i
  }
  callings.forEach {
    let index = dic[$0]!
    let tempPlayer = players[index - 1]
    players[index - 1] = players[index]
    players[index] = tempPlayer

    dic[tempPlayer]! += 1
    dic[$0]! -= 1
  }
  return players
}