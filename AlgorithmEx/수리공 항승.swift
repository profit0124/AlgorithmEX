//
//  수리공 항승.swift
//  AlgorithmEx
//
//  Created by Sooik Kim on 1/2/24.
//

import Foundation
//let firstInput = readLine()!.components(separatedBy: " ")
//let secondInput = readLine()!.components(separatedBy: " ")
//let total = Int(firstInput.first!)!
//let distance = Double(firstInput.last!)!
//let array = Set(secondInput.map { Double($0)! }).sorted()
//
//var result = total
//
//check(array: array, count: 0, distance: distance, minVal: 0, maxVal: 0)

//
//
//func check(array: [Double], count: Int, distance: Double, minVal: Double, maxVal: Double) {
//    var temp = array
//    let base = temp.removeFirst()
//    let startPoint = base - 0.5
//    let endPoint = base + 0.5
//    
//    if minVal <= startPoint, maxVal >= endPoint {
//        if temp.isEmpty {
//            result = min(count, result)
//        } else {
//            check(array: temp, count: count, distance: distance, minVal: minVal, maxVal: maxVal)
//            check(array: temp, count: count + 1, distance: distance, minVal: startPoint, maxVal: startPoint + distance)
//            check(array: temp, count: count + 1, distance: distance, minVal: endPoint - distance, maxVal: endPoint)
//        }
//    } else {
//        if temp.isEmpty {
//            result = min(count + 1, result)
//        } else {
//            check(array: temp, count: count + 1, distance: distance, minVal: startPoint, maxVal: startPoint + distance)
//            check(array: temp, count: count + 1, distance: distance, minVal: endPoint - distance, maxVal: endPoint)
//        }
//    }
//}
