import Foundation

func solution(_ n:Int) -> Int {
    var lastNumber = 0
    for _ in 0..<n {
        lastNumber = makeNumber(lastNumber: lastNumber)
    }
    return lastNumber
}

func isMultipleOfThree(_ n: Int) -> Bool {
    return n % 3 == 0
}

func isContainThree(_ n: Int) -> Bool {
    return String(n).contains("3")
}

func makeNumber(lastNumber: Int) -> Int {
    var result = lastNumber + 1
    while isMultipleOfThree(result) || isContainThree(result) {
        result += 1
    }
    
    return result
}