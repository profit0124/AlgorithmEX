//
//  main.swift
//  AlgorithmEx
//
//  Created by Sooik Kim on 1/2/24.
//

import Foundation


// MARK: 수리공 항승
let firstInput = readLine()!.components(separatedBy: " ")
let secondInput = readLine()!.components(separatedBy: " ")
let total = Int(firstInput.first!)!
let distance = Double(firstInput.last!)!
let array = secondInput.map { Double($0)! }

var result = total

check(array: array, count: 0, distance: distance, minVal: 0, maxVal: 0)
print(result)


