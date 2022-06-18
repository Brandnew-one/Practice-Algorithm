import Foundation

// 정말 단순한 구현문제 였는데 뭔가 아름다운 풀이방법이 생각나지 않아서 깡 구현하느라 시간이 좀 걸렸다.
// Array(dartResult)로 String을 Array로 바꾸면 String.Element로 String 타입이 아니라 Character 타입이였다..
// 차라리 split을 이용해서 문자열을 나누고 시작하는 것도 나쁘지 않을것 같다

func solution(_ dartResult: String) -> Int {
  let arr = Array(dartResult)
  let refNumbers: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"]
  let refBonus: [Character] = ["S", "D", "T"]
  let refOption: [Character] = ["*", "#"]

  var index: Int = 0
  var numbersIndex: Int = 0
  var numbers: [Int] = [0, 0, 0]

  while true {
    if index >= arr.count { break } // 탈출조건
    // 1) 숫자인 경우
    if refNumbers.contains(arr[index]) {
      // 1-1) 10이 들어오는 경우를 대비
      if refNumbers.contains(arr[index + 1]) {
        numbers[numbersIndex] = Int(String(String(arr[index]) + String(arr[index + 1])))!
        index += 2
      } else {
        numbers[numbersIndex] = Int(String(arr[index]))!
        index += 1
      }
    }
    // 2) 보너스인 경우
    if refBonus.contains(arr[index]){
      let nowBonus = arr[index]
      if nowBonus == "D" {
        numbers[numbersIndex] *= numbers[numbersIndex]
      }
      if nowBonus == "T" {
        numbers[numbersIndex] *= (numbers[numbersIndex] * numbers[numbersIndex])
      }

      // 3) 옵션이 존재하는 지?
      if index + 1 < arr.count {
        if refOption.contains(arr[index + 1]) {
          let nowOption = arr[index + 1]
          if nowOption == "*" {
            if numbersIndex == 0 {
              numbers[numbersIndex] *= 2
            } else {
              numbers[numbersIndex - 1] *= 2
              numbers[numbersIndex] *= 2
            }
          }
          if nowOption == "#" {
            numbers[numbersIndex] *= -1
          }
          index += 2
        } else { // 옵션이 존재하지 않고 다음 숫자가 존재하는 경우
          index += 1
        }
        numbersIndex += 1
      } else { break }
    }
  }
  return numbers[0] + numbers[1] + numbers[2]
}
