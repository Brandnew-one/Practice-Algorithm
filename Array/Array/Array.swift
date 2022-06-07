//
//  main.swift
//  Array
//
//  Created by Bran on 2022/06/07.
//

import Foundation

// Array의 특성
/// 1) 임의의 위치에 있는 원소 확인 및 변경 = O(1)
/// 2) 끝위치에 원소 추가 및 마지막 원소 제거 = O(1)
/// 3) 임의의 위치 원소 추가 및 제거 = O(N)

// 배열은 이미 충분한 공간이 존재하고 값이 할당되지 않은 경우 쓰레기값이 존재한다고 가정
var arr: [Int] = [1, 2, 3, 4, 0, 0, 0]
print(arr[2])
arr[4] = 5

// MARK: -  임의의 위치에 원소 추가
func insertInt(arr: inout [Int], size: Int ,index: Int, num: Int) {
  for i in stride(from: size, through: index + 1, by: -1) {
    arr[i] = arr[i - 1]
  }
  arr[index] = num
}

// MARK: -  임의의 위치에 원소 삭제
func removeInt(arr: inout [Int], size: Int ,index: Int) {
  for i in index...size - 1 {
    arr[i] = arr[i + 1]
  }
}

print(arr)
insertInt(arr: &arr, size: 5, index: 1, num: 10)
print(arr)
removeInt(arr: &arr, size: 6, index: 1)
print(arr)


// MARK: -  Swift에 이미 구현된 메서드를 확인해보자!
var array: [Int] = [1, 2, 3, 4, 5]
print(array)
array.insert(20, at: 1) // O(N)
print(array)
array.remove(at: 1) // O(N)
print(array)
