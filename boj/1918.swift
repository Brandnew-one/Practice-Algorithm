import Foundation

let infix = readLine()!.map { String($0) }
var stack: [String] = []
var postfix = ""

for num in infix {
  if isNumber(num) { 
    postfix += num
  } else {
    if num == "(" {
      stack.append(num)
    } else if num == ")" {
      while stack.last! != "(" { postfix += stack.removeLast() }
      stack.removeLast()
    } else {
      if stack.isEmpty { stack.append(num) }
      else {
        while operatorPriority(stack.last!) >= operatorPriority(num) {
          postfix += stack.removeLast()
          if stack.isEmpty { break }
        }
        stack.append(num)
      }
    }
  }
}

while !stack.isEmpty { postfix += stack.removeLast() }

print(postfix)

func isNumber(_ str: String) -> Bool {
  !(str == "(" || str == ")" || str == "*" || str == "/" || str == "+" || str == "-")
}

func operatorPriority(_ str: String) -> Int {
  switch str {
  case "(":
    return 0
  case "+", "-":
    return 1
  case "*", "/":
    return 2
  default:
    return 3
  }
}