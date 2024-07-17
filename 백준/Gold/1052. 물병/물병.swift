import Foundation


let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
var n = input[0]
let k = input[1]

let binaryNumber = Array(String(n, radix: 2))
var count = binaryNumber.count - 1
var temp: [Double] = []
for i in 0..<binaryNumber.count {
    var number = 0.0
    if binaryNumber[i] == "1" {
        number = pow(2.0, Double(count - i))
        temp.append(number)
    }
}
if temp.count <= k {
    print(0)
} else {
    print(Int(temp[k-1] - temp[k..<temp.count].reduce(0){ $0 + $1 }))
}
