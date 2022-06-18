import Foundation

// 확실히 Swift로 문자열 다루는게 아직 부족하다는 걸 느꼈다.
// $0[$0.index($0.startIndex, offsetBy: n)] 이것보다 좀 더 효율적으로 n번째 인덱스에 접근하는 방법이 있는지 찾아보기

func solution(_ strings: [String], _ n: Int) -> [String] {
    var stringArr = strings
    return stringArr.sorted {
        if $0[$0.index($0.startIndex, offsetBy: n)] == $1[$1.index($1.startIndex, offsetBy: n)] {
            return $0 < $1
        } else {
            return $0[$0.index($0.startIndex, offsetBy: n)] < $1[$1.index($1.startIndex, offsetBy: n)]
        }
    }
}