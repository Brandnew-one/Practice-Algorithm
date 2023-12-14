import Foundation

let p1 = readLine()!.split(separator: " ").map { Int($0)! }
let p2 = readLine()!.split(separator: " ").map { Int($0)! }
let p3 = readLine()!.split(separator: " ").map { Int($0)! }

let abX = p2[0] - p1[0]
let abY = p2[1] - p1[1]
let acX = p3[0] - p1[0]
let acY = p3[1] - p1[1]

let product = abX * acY - acX * abY

if product == 0 {
  print("0")
} else if product > 0 {
  print("1")
} else {
  print("-1")
}