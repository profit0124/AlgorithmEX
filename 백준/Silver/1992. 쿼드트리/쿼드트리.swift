
let counts = Int(readLine()!)!
var inputDatas:[[Int]] = []
for _ in 0..<counts {
    let temp = readLine()!.map{ Int(String($0))! }
    inputDatas.append(temp)
}

recursion(inputDatas, number: counts)

func division(_ array: [[Int]], number: Int) -> [[[Int]]] {
    var result: [[[Int]]] = []
    let halfNumber = number / 2
    for i in 0..<2 {
        
        var left:[[Int]] = []
        var right:[[Int]] = []
        let startIndex = halfNumber * i
        let endIndex = startIndex + halfNumber
        for j in startIndex..<endIndex {
            var temp = array[j]
            var leftLine:[Int] = []
            var rightLine:[Int] = []
            for _ in 0..<halfNumber {
                leftLine.append(temp.removeFirst())
            }
            rightLine = temp
            left.append(leftLine)
            right.append(rightLine)
        }
        result.append(left)
        result.append(right)
    }
    return result
}


func recursion(_ array: [[Int]], number: Int) {
    let temp = array.flatMap{ $0 }.filter{ $0 == 0 }
    
    if temp.count == (number * number) {
        print("\(0)", terminator: "")
    } else if temp.isEmpty {
        print("\(1)", terminator: "")
    } else {
        print("(", terminator: "")
        let arrays = division(array, number: number)
        let number = number / 2
        for i in arrays {
            recursion(i, number: number)
        }
        print(")", terminator: "")
    }
}
