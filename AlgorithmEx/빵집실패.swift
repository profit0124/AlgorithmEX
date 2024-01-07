////
////  File.swift
////  AlgorithmEx
////
////  Created by Sooik Kim on 1/7/24.
////
//
//import Foundation
//
//var inputSize = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//let col = inputSize.removeLast()
//let row = inputSize.removeLast()
//
//var array:[[String]] = []
//var result = 0
//
//for _ in 0..<row {
//    let path = readLine()!.map{ String($0) }
//    array.append(path)
//}
//
//var maxRow = 0
//for i in 0..<row {
//    let beforeArray = array
//    var isSuccess = true
//    var pathRow = i
//    for j in 0..<col {
//        if pathRow - 1 > 0 && array[pathRow - 1][j] == "." {
//            array[pathRow - 1][j] = "x"
//            pathRow -= 1
//        } else if array[pathRow][j] == "." {
//            array[pathRow][j] = "x"
//        } else if pathRow + 1 < row && array[pathRow + 1][j] == "." {
//            array[pathRow + 1][j] = "x"
//            pathRow += 1
//            maxRow = max(pathRow, maxRow)
//        } else {
//            isSuccess = false
//            maxRow = max(pathRow, maxRow)
//            break
//        }
//    }
//    
//    if isSuccess {
//        result += 1
//    } else {
//        array = beforeArray
//    }
//    if maxRow == row - 1 {
//        break
//    }
//}
//
//print(result)
//
