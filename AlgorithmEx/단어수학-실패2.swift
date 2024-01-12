////
////  단어수학-실패2.swift
////  AlgorithmEx
////
////  Created by Sooik Kim on 1/7/24.
////
//import Foundation
//
//var inputSize = Int(readLine()!)!
//var testDatas: [String] = []
//var maxSize: Int = 0
//for _ in 0..<inputSize {
//    let input = readLine()!
//    maxSize = max(maxSize, input.count)
//    testDatas.append(input)
//}
//var result = 0
//
//var testArray:[[Character]] = []
//for item in testDatas {
//    let gap = maxSize - item.count
//    if gap == 0 {
//        testArray.append(item.map{ $0 })
//    } else {
//        var prefix: String = ""
//        for _ in 0..<gap {
//            prefix += "0"
//        }
//        testArray.append((prefix + item).map{ $0 })
//    }
//}
//
//var dict: [Int: [Character]] = [:]
//
//var dictCount = 0
//
//func recursion(count:Int) {
//    if maxSize >= count {
//        let powValue = maxSize - count
//        let dictKey = 9 - dictCount
//        let tenPow = Int(pow(10.0, Double(powValue)))
//        var tempDict: [Int:[Character]] = [:]
//        var tempResult = 0
//        for i in 0..<testArray.count {
//            let value = testArray[i].removeFirst()
//            var isAppended = false
//            if value != "0" {
//                for (tempKey, tempValue) in dict {
//                    if tempValue.contains(value) {
//                        tempDict[tempKey, default: []].append(value)
//                        isAppended = true
//                        break
//                    }
//                }
//                if !isAppended {
//                    tempDict[dictKey, default: []].append(value)
//                }
//            }
//        }
//        
//        var testDict:[Int: [Character]] = [:]
//        for (key, value) in tempDict {
//            var countDict: [Character: Int] = [:]
//            for char in value {
//                countDict[char, default: 0] += 1
//            }
//            
//            let sortedCountdDict = countDict.sorted{ $0.1 > $1.1 }
//            var tempGap = 0
//            var tempCount = 0
//            var addCount = 0
//            for (newKye, newValue) in sortedCountdDict {
//                if tempCount == 0 {
//                    tempCount = newValue
//                    testDict[key] = [newKye]
//                } else if tempCount == newValue {
//                    testDict[key - tempGap]?.append(newKye)
//                    addCount += 1
//                } else {
//                    tempCount = newValue
//                    tempGap += 1 + addCount
//                    addCount = 0
//                    testDict[key - tempGap] = [newKye]
//                }
//                if key - tempGap - addCount >= 0 {
//                    tempResult += (key - tempGap - addCount) * tempCount
//                }
//            }
//        }
//        
//        for (key, value) in testDict {
//            if let tempArray = dict[key] {
//                let temp = tempArray.filter { !value.contains($0) }
//                if !temp.isEmpty {
//                    let newKey = key - value.count
//                    dict[newKey] = temp
//                    dict[key] = value
//                } else {
//                    dict[key] = value
//                }
//            } else {
//                dict[key] = value
//            }
//        }
//        result += tempResult * tenPow
//        dictCount = dict.reduce(0) { $0 + $1.value.count }
//        recursion(count: count + 1)
//    }
//}
//recursion(count: 1)
//for (key, value) in dict {
//    print("\(key) : \(value)")
//}
//print(result)
