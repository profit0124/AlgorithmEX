import Foundation

func solution(_ numbers:[Int], _ hand:String) -> String {
    let phones: [[Int]] = [[1,4,7,99], [2,5,8,0], [3,6,9,99]]
    var leftPosition: [Int] = [0, 3]
    var rightPosition: [Int] = [2, 3]
    var result = ""
    
    for number in numbers {
        var flag: Bool = false
        for i in 0..<phones.count {
            for j in 0..<phones[i].count {
                if phones[i][j] == number {
                    if i == 0 {
                        result += "L"
                        leftPosition = [i, j]
                        flag = true
                        break
                    }
                    
                    if i == 2 {
                        result += "R"
                        rightPosition = [i, j]
                        flag = true
                        break
                    }
                    
                    let leftDistance = abs(leftPosition[0] - i) + abs(leftPosition[1] - j)
                    let rightDistance = abs(rightPosition[0] - i) + abs(rightPosition[1] - j)
                    
                    if leftDistance < rightDistance || (leftDistance == rightDistance && hand == "left") {
                        result += "L"
                        leftPosition = [i, j]
                        flag = true
                        
                        break
                    } else {
                        result += "R"
                        rightPosition = [i, j]
                        flag = true
                        break
                    }
                }
            }
            if flag {
                break
            }
        }
    }
    
    return result
}