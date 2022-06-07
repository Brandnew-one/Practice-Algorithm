//
//  10808.swift
//  Array
//
//  Created by Bran on 2022/06/07.
//

import Foundation

let s = [Character](readLine()!)
let a: Character = "a"
var arr: [Int] = Array<Int>.init(repeating: 0, count: 26)

for c in s {
  arr[Int(c.asciiValue! - a.asciiValue!)] += 1
}

for i in arr {
  print(i, terminator: " ")
}
