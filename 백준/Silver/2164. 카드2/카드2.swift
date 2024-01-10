import Foundation


var inputDatas = Array(1...Int(readLine()!)!)

var result:Int = 1
var index:Int = 0

if inputDatas.count != 1 {
    while inputDatas[inputDatas.count - 2] != 0 {
        inputDatas[index] = 0
        let bottom = inputDatas[index + 1]
        inputDatas[index + 1] = 0
        inputDatas.append(bottom)
        index += 2
    }
    result = inputDatas.last!
}
print(result)
