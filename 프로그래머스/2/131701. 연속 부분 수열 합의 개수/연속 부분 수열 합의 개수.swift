import Foundation

func solution(_ elements:[Int]) -> Int {
    let count = elements.count
    var result = Set<Int>()
    for i in 0..<count {
        var temp = elements[i]
        result.insert(temp)
        for j in 1..<count {
            let index = (i + j) % count
            temp += elements[index]
            result.insert(temp)
        }
    }
    return result.count
}