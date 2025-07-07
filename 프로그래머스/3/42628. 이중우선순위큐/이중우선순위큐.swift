import Foundation

func solution(_ operations:[String]) -> [Int] {
    var queue: [Int] = []
    
    var maxNum: Int = Int.min
    var minNum: Int = Int.max
    
    func resetNum() {
        if queue.isEmpty {
            maxNum = Int.min
            minNum = Int.max
        }
    }
    
    for operation in operations {
        let oper = operation.split(separator: " ")[0]
        guard let num = Int(operation.split(separator: " ")[1]) else { continue }
        if oper == "I" {
            queue.append(num)
            maxNum = max(maxNum, num)
            minNum = min(minNum, num)
        } else {
            if !queue.isEmpty {
                if num == 1 {
                    var temp = Int.min
                    let tempQueue = queue
                    for (index, value) in tempQueue.enumerated() {
                        if maxNum == value {
                            queue.remove(at: index)
                            maxNum = Int.min
                            resetNum()
                        } else {
                            temp = max(temp, value)
                        }
                    }
                    maxNum = temp
                } else {
                    var temp = Int.max
                    let tempQueue = queue
                    for (index, value) in tempQueue.enumerated() {
                        if minNum == value {
                            queue.remove(at: index)
                            minNum = Int.max
                            resetNum()
                        } else {
                            temp = min(temp, value)
                        }
                    }
                    minNum = temp
                }
            }
        }
    }
    
    return queue.isEmpty ? [0, 0] : [maxNum, minNum]
}