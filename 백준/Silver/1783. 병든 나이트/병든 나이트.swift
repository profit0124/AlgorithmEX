import Foundation

var inputData = readLine()!.components(separatedBy: " ").map{ Int($0)! }

var result = 0
var current:[Int] = [1, 1]

let row = inputData[0]

switch row {
case 1:
    result = 1
    
case 2:
    let temp = (inputData[1] - 1) / 2
    result = min(temp + 1, 4)
    
default:
    if inputData[1] > 6 {
        result = inputData[1] - 2
    } else {
        result = min(4, inputData[1])
    }
}

print(result)