//
//  친구 네트워크-실패.swift
//  AlgorithmEx
//
//  Created by Sooik Kim on 1/14/24.
//

import Foundation

// MARK: 시간 초과
//let input = Int(readLine()!)!
//
//var inputCounts:[Int] = []
//var inputNetworks:[[[String]]] = []
//
//for _ in 0..<input {
//    let tempCounts = Int(readLine()!)!
//    inputCounts.append(tempCounts)
//    var tempNetworks = Array<[String]>()
//    for _ in 0..<tempCounts {
//        let tempNames = readLine()!.components(separatedBy: " ").map{ String($0) }
//        tempNetworks.append(tempNames)
//    }
//    inputNetworks.append(tempNetworks)
//}
//
//for i in 0..<input {
//    let networks = inputNetworks[i]
//    
//    var dict:[Int: Set<String>] = [:]
//    var maxIndex: Int = 0
//    for names in networks {
//        var containIndex:[Int] = []
//        for (key, value) in dict {
//            if value.contains(names[0]) || value.contains(names[1]) {
//                dict[key, default: Set<String>()].insert(names[0])
//                dict[key, default: Set<String>()].insert(names[1])
//                containIndex.append(key)
//            }
//        }
//        if containIndex.isEmpty {
//            dict[maxIndex, default: Set<String>()].insert(names[0])
//            dict[maxIndex, default: Set<String>()].insert(names[1])
//            print("2")
//            maxIndex += 1
//        } else {
//            let base = containIndex.removeFirst()
//            for i in containIndex {
//                dict[base]! = dict[base]!.union(dict[i]!)
//                dict[i]?.removeAll()
//            }
//            print(dict[base]!.count)
//        }
//    }
//}


// MARK: 메모리 초과

//let input = Int(readLine()!)!
//
//var inputCounts:[Int] = []
//var inputNetworks:[[[String]]] = []
//
//for _ in 0..<input {
//    let tempCounts = Int(readLine()!)!
//    inputCounts.append(tempCounts)
//    var tempNetworks = Array<[String]>()
//    for _ in 0..<tempCounts {
//        let tempNames = readLine()!.components(separatedBy: " ")
//        tempNetworks.append(tempNames)
//    }
//    inputNetworks.append(tempNetworks)
//}
//
//for i in 0..<input {
//    let networks = inputNetworks[i]
//    
//    var dict:[String: Set<String>] = [:]
//    
//    for names in networks {
//        dict[names[0]] = dict[names[0], default: [names[0]]].union(dict[names[1], default: [names[1]]])
//        dict[names[1]] = dict[names[1], default: [names[1]]].union(dict[names[0], default: [names[0]]])
//        
//        print(dict[names[1]]?.count ?? 0)
//    }
//}
