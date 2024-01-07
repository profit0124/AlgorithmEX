////
////  단어수학-실패1.swift
////  AlgorithmEx
////
////  Created by Sooik Kim on 1/7/24.
////
//import Foundation
//
//var inputSize = Int(readLine()!)!
//var testData: String = ""
//
//for _ in 0..<inputSize {
//    testData += readLine()! + " "
//}
//var result = 0
//
//let temp1 = Set<Character>(testData.map { $0 }.filter{ $0 != " "}).map{ $0 }
//let temp1Count = temp1.count
//let testCaesNumber = Array((9 - temp1Count + 1)...9)
//changeRecursive(numberArray: testCaesNumber, characterArray: temp1, matchingData: [:])
//func changeRecursive(numberArray:[Int], characterArray:[Character], matchingData: [Character: Int]) {
//    if numberArray.isEmpty {
//        var changeMan = ""
//        for c in testData {
//            if let num = matchingData[c] {
//                changeMan += String(num)
//            } else {
//                changeMan += " "
//            }
//        }
//        let testCase = changeMan.components(separatedBy: " ").compactMap{ Int($0) }
//        result = max(result, testCase.reduce(0) { $0 + $1 })
//    } else {
//        for i in 0..<numberArray.count {
//            var numbers = numberArray
//            var characters = characterArray
//            var datas = matchingData
//            let number = numbers.removeLast()
//            let chracter = characters.remove(at: i)
//            datas[chracter] = number
//            changeRecursive(numberArray: numbers, characterArray: characters, matchingData: datas)
//            
//        }
//    }
//}
//
//print(result)
