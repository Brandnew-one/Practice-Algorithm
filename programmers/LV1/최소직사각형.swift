import Foundation

/// 가로, 세로 값을 받아서 가장 더 큰값을 가로로 설정 (돌려서)
/// 그 이후 가로의 최대 * 세로의 최대를 반환

func solution(_ sizes:[[Int]]) -> Int {
    var width: [Int] = []
    var height: [Int] = []
    
    for item in sizes {
        if item[0] < item[1] {
            width.append(item[1])
            height.append(item[0])
        } else {
            width.append(item[0])
            height.append(item[1])
        }
    }
    
    return width.max()! * height.max()!
}