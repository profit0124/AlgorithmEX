//
//  main.swift
//  AlgorithmEx
//
//  Created by Sooik Kim on 1/2/24.
//

import Foundation


// MARK: 수리공 항승
//let firstInput = readLine()!.components(separatedBy: " ")
//let secondInput = readLine()!.components(separatedBy: " ")
//let total = Int(firstInput.first!)!
//let distance = Double(firstInput.last!)!
//let array = Set(secondInput.map { Double($0)! }).sorted()
//
//var result = total
//
//check(array: array, count: 0, distance: distance, minVal: 0, maxVal: 0)
//print(result)


// MARK: 안테나

//let total = Int(readLine()!)
//let array = readLine()!.components(separatedBy: " ").map { Int( $0 )! }.sorted()
//
//var position = 0
//var distance: Int?
//
//
//
//for i in array {
//    if position != i {
//        var sum = 0
//        for j in array {
//            var distance = j - i
//            if distance < 0 {
//                distance *= -1
//            }
//            sum += distance
//        }
//        if distance != nil {
//            if distance! > sum {
//                position = i
//                distance = sum
//            }
//        } else {
//            distance = sum
//            position = i
//        }
//    }
//}
//
//print(position)

// 잃어버린 괄호
//
//var array = readLine()!.components(separatedBy: "-")
//
////let firstItem = array.removeFirst().components(separatedBy: "+").map{ Int($0)! }.reduce(0){ $0 + $1 }
//var result = array.removeFirst().components(separatedBy: "+").map{ Int($0)! }.reduce(0){ $0 + $1 }
//for item in array {
//    result -= item.components(separatedBy: "+").map{ Int($0)! }.reduce(0){ $0 + $1 }
//}
//
//print(result)
