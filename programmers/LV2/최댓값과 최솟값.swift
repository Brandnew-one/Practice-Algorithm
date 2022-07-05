import Foundation

// 이딴게 LV2...?
func solution(_ s: String) -> String {
  let splited = s.components(separatedBy: " ")
    .map { Int($0)! }
    .sorted { $0 < $1 }
  return "\(splited.first!) \(splited.last!)"
}