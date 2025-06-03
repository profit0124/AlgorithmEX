import Foundation

func solution(_ s:String) -> [Int] {
    var memory: [Character: Int] = [:]
    var result: [Int] = []
    
    for (index, char) in s.enumerated() {
        if let lastIndex = memory[char] {
            result.append(index - lastIndex)
        } else {
            result.append(-1)
        }
        memory[char] = index
    }
    
    return result
}
