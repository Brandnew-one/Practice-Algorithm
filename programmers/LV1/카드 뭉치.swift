import Foundation

func solution(
  _ cards1: [String],
  _ cards2: [String],
  _ goal: [String]
) -> String {
  var tempCards1 = cards1
  var tempCards2 = cards2
  
  for s in goal {
    if let fCard1 = tempCards1.first {
      if fCard1 == s {
        tempCards1.removeFirst()
        continue
      }
    }
    if let fCard2 = tempCards2.first {
      if fCard2 == s {
        tempCards2.removeFirst()
        continue
      }
    }
    return "NO"
  }
  return "YES"
}