import Foundation


var inputDatas:[String] = []

while true {
    var input = readLine()!
    if input == "." {
        break
    } else {
        inputDatas.append(input)
    }
}

for item in inputDatas {
    var check:[Character] = []
    for char in item {
        if char == "(" || char == "[" {
            check.append(char)
        } else if char == ")" {
            if check.isEmpty {
                print("no")
                break
            } else {
                let last = check.removeLast()
                if last != "(" {
                    print("no")
                    break
                }
            }
        } else if char == "]" {
            if check.isEmpty {
                print("no")
                break
            } else {
                let last = check.removeLast()
                if last != "[" {
                    print("no")
                    break
                }
            }
        } else if char == "." {
            if check.isEmpty {
                print("yes")
            } else {
                print("no")
            }
        }
    }
}
