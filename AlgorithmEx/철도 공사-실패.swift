////
////  철도 공사-실패.swift
////  AlgorithmEx
////
////  Created by Sooik Kim on 1/15/24.
////
//import Foundation
//
//struct LinkedList {
//    var previous: String
//    var next: String
//    
//    init(previous: String, next: String) {
//        self.previous = previous
//        self.next = next
//    }
//}
//
//let input = readLine()!.components(separatedBy: " ").map{ Int($0)! }
//
//let inputDatas = readLine()!.components(separatedBy: " ")
//
//var dict:[String: LinkedList] = [:]
//
//for i in 0..<input[0] {
//    var previousIndex = 0
//    var nextIndex = 0
//    let count = input[0] - 1
//    if i == 0 {
//        previousIndex = count
//        nextIndex = i + 1
//    } else if i == count {
//        previousIndex = i - 1
//        nextIndex = 0
//    } else {
//        previousIndex = i - 1
//        nextIndex = i + 1
//    }
//    
//    dict[inputDatas[i]] = LinkedList(previous: inputDatas[previousIndex], next: inputDatas[nextIndex])
//}
//
//var testCases:[[String]] = []
//
//for i in 0..<input[1] {
//    let testCase = readLine()!.components(separatedBy: " ")
//    testCases.append(testCase)
//}
//
//for testCase in testCases {
//    switch testCase[0] {
//    case "BN":
//        let base = testCase[1]
//        let push = testCase[2]
//        var temp = dict[base]!
//        let originalNext = temp.next
//        temp.next = push
//        dict[base] = temp
//        print(originalNext)
//        dict[push] = .init(previous: base, next: originalNext)
//        dict[originalNext]!.previous = push
//        
//    case "BP":
//        let base = testCase[1]
//        let push = testCase[2]
//        var temp = dict[base]!
//        let originalPrevious = temp.previous
//        temp.previous = push
//        print(originalPrevious)
//        dict[base] = temp
//        dict[push] = .init(previous: originalPrevious, next: base)
//        dict[originalPrevious]!.next = push
//        
//    case "CN":
//        let base = testCase[1]
//        var temp = dict[base]!
//        print(temp.next)
//        let nextValue = temp.next
//        dict[base]!.next = dict[nextValue]!.next
//        dict[nextValue]!.previous = base
//        
//    default:
//        let base = testCase[1]
//        var temp = dict[base]!
//        print(temp.previous)
//        let previousValue = temp.previous
//        dict[base]!.previous = dict[previousValue]!.previous
//        dict[previousValue]!.next = base
//    }
//}

