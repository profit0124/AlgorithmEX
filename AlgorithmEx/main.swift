//
//  main.swift
//  AlgorithmEx
//
//  Created by Sooik Kim on 1/2/24.
// 재귀함수가 무엇인가요?

import Foundation

let counts = Int(readLine()!)!

let firstIndex = counts - 1
print(String.init(repeating: " ", count: firstIndex) + "*")

var progressIndex = 1
let previousIndexes:[[Int]] = [[firstIndex]]
let oneLineCounts = counts * 2 - 1

let temp:[[Int]] = [[1,2], [3,4]]


func recursion(index: Int, previousIndexes:[[Int]]) {
    let remain = index % 3
    var printIndexes:[[Int]] = []
    
    if remain == 1 {
        for indexes in previousIndexes {
            var tempIndex:[Int] = []
            for index in indexes {
                tempIndex.append(index - 1)
                tempIndex.append(index + 1)
            }
            printIndexes.append(tempIndex)
        }
    } else if remain == 2 {
        for indexes in previousIndexes {
            var tempIndex:[Int] = []
            for i in indexes[0]-1...indexes[1]+1 {
                tempIndex.append(i)
            }
            printIndexes.append(tempIndex)
        }
    } else {
        let tempCounts = previousIndexes.count
        
        if tempCounts == 1 {
            printIndexes.append([previousIndexes[0].first! - 1])
            printIndexes.append([previousIndexes[0].last! + 1])
        } else {
            for i in 0..<tempCounts {
                if i == 0 {
                    printIndexes.append([previousIndexes[i].first! - 1])
                    if previousIndexes[i].last! + 2 != previousIndexes[i+1].first! {
                        printIndexes.append([previousIndexes[i].last! + 1])
                    }
                } else if i < previousIndexes.count - 1 {
                    if previousIndexes[i-1].last! + 2 != previousIndexes[i].first! {
                        printIndexes.append([previousIndexes[i].first! - 1])
                    }
                    if previousIndexes[i].last! + 2 != previousIndexes[i+1].first! {
                        printIndexes.append([previousIndexes[i].last! + 1])
                    }
                } else {
                    if previousIndexes[i-1].last! + 2 != previousIndexes[i].first! {
                        printIndexes.append([previousIndexes[i].first! - 1])
                    }
                    printIndexes.append([previousIndexes[i].last! + 1])
                }
            }
        }
    }
    let temp = printIndexes.flatMap({ $0 })
    for i in 0..<oneLineCounts {
        if temp.contains(i) {
            print("*", terminator: "")
        } else {
            print(" ", terminator: "")
        }
    }
    if index != counts - 1 {
        print("  ")
    } else {
        print(" ")
    }
    
    let index = index + 1
    if index < counts {
        recursion(index: index, previousIndexes: printIndexes)
    }
}

recursion(index: progressIndex, previousIndexes: previousIndexes)

