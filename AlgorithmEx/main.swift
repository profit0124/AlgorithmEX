//
//  main.swift
//  AlgorithmEx
//
//  Created by Sooik Kim on 1/2/24.
//
// 단어수학 - 실패2
import Foundation

var inputSize = Int(readLine()!)!
var testDatas: [String] = []
var maxSize: Int = 0
for _ in 0..<inputSize {
    let input = readLine()!
    maxSize = max(maxSize, input.count)
    testDatas.append(input)
}
var result = 0

var testArray:[[Character]] = []
for item in testDatas {
    let gap = maxSize - item.count
    if gap == 0 {
        testArray.append(item.map{ $0 })
    } else {
        var prefix: String = ""
        for _ in 0..<gap {
            prefix += "0"
        }
        testArray.append((prefix + item).map{ $0 })
    }
}

var dict: [Int: [Character]] = [:]

var dictCount = 0

func recursion(completeArray:[Int], count:Int) {
    if maxSize >= count {
        var completeArray = completeArray
        let powValue = maxSize - count
        let dictKey = 9 - dictCount
        let tenPow = Int(pow(10.0, Double(powValue)))
        var tempDict: [Int:[Character]] = [:]
        var tempResult = 0
        for i in 0..<testArray.count {
            let value = testArray[i].removeFirst()
            var isAppended = false
            if value != "0" {
                for j in completeArray {
                    if dict[j]?.contains(value) ?? false {
                        if tempDict[j] == nil {
                            tempDict[j] = []
                        }
                        tempDict[j]?.append(value)
                        isAppended = true
                        break
                    }
                }
                if !isAppended {
                    if !completeArray.contains(dictKey) {
                        completeArray.append(dictKey)
                    }
            
                    if tempDict[dictKey] == nil {
                        tempDict[dictKey] = []
                    }
                    if !(tempDict[dictKey]?.contains(value) ?? true) {
                        dictCount += 1
                    }
                    tempDict[dictKey]?.append(value)
                }
            }
        }
        
        var testDict:[Int: [Character]] = [:]
        for (key, value) in tempDict {
            var countDict: [Character: Int] = [:]
            for char in value {
                if countDict[char] == nil {
                    countDict[char] = 1
                } else {
                    countDict[char]! += 1
                }
            }
            
            let sortedCountdDict = countDict.sorted{ $0.1 > $1.1 }
            var tempGap = 0
            var tempCount = 0
            var addCount = 0
            for (newKye, newValue) in sortedCountdDict {
                if tempCount == 0 {
                    tempCount = newValue
                    testDict[key - tempGap] = [newKye]
                } else if tempCount == newValue {
                    testDict[key - tempGap]?.append(newKye)
                    addCount += 1
                } else {
                    tempCount = newValue
                    tempGap += 1 + addCount
                    addCount = 0
                    testDict[key - tempGap] = [newKye]
                }
                if key - tempGap - addCount > 0 {
                    tempResult += (key - tempGap - addCount) * tempCount
                }
            }
        }
        
        
        for (key, value) in testDict {
            if let tempArray = dict[key] {
                let temp = tempArray.filter { !value.contains($0) }
                let newKey = key - temp.count
                if newKey != 0 {
                    completeArray.append(newKey)
                    dict[newKey] = temp
                    dict[key] = value
                }
            } else {
                dict[key] = value
            }
        }
        result += tempResult * tenPow
        recursion(completeArray: completeArray, count: count + 1)
    }
}
recursion(completeArray: [], count: 1)
print(result)
