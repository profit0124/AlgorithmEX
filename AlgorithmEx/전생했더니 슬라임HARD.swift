//
//  전생했더니 슬라임HARD.swift
//  AlgorithmEx
//
//  Created by Sooik Kim on 1/12/24.
//
//
//import Foundation
//
//var inputSize = Int(readLine()!)!
//
//let divide = 1000000007
//
//var counts:[Int] = []
//var testCases:[[Int]] = []
//
//for _ in 0..<inputSize {
//    counts.append(Int(readLine()!)!)
//    testCases.append(readLine()!.components(separatedBy: " ").map{ Int($0)! }.sorted())
//}
//
//for i in 0..<inputSize {
//    var testCase = testCases[i]
//    var count = counts[i]
//    
//    var resultArray:[Int] = []
//    
//    while count > 1 {
//        var tempArray = Array<Int>()
//        for j in 0..<count {
//            if j % 2 == 1 {
//                let first = testCase[j]
//                let second = testCase[j - 1]
//                let temp = first * second
//                tempArray.append(temp)
//                resultArray.append(temp)
//                if j == count - 1 {
//                    count /= 2
//                } else {
//                    
//                }
//            } else {
//                if j == count - 1 {
//                    count = (count / 2) + 1
//                    tempArray.append(testCase[j])
//                }
//            }
//        }
//        testCase = tempArray.sorted()
//    }
//    var result = 1
//    for item in resultArray {
//        if result > divide {
//            result %= divide
//        } else if item == resultArray.last {
//            result *= item % divide % divide
//        } else {
//            result *= item
//        }
//    }
//    print(result)
//}
