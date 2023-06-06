import Foundation

func solution(_ data: [[Int]], _ col: Int, _ row_begin: Int, _ row_end: Int) -> Int {
  let sortedData = data.sorted {
    if $0[col - 1] == $1[col - 1] {
      return $0[0] > $1[0]
    } else {
      return $0[col - 1] < $1[col - 1]
    }
  }

  var dataArr: [Int] = []
  for i in row_begin...row_end {
    let tuple = sortedData[i - 1]
    var modSum: Int = 0
    for t in tuple {
      modSum += t % i
    }
    dataArr.append(modSum)
  }

  return dataArr.reduce(0, ^)
}