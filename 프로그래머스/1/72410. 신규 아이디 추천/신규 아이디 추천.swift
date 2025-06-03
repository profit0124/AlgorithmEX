import Foundation

func solution(_ new_id:String) -> String {
    let first = stepOne(new_id)
    let two = stepTwo(first)
    let three = stepThree(two)
    let four = stepFour(three)
    let five = stepFive(four)
    let six = stepFour(stepSix(five))
    let temp = stepFive(six)
    let seven = stepSeven(temp)
    return seven.joined()
}

func stepOne(_ text: String) -> String {
    return text.lowercased()
}

func stepTwo(_ text: String) -> [String] {
    let minus = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p","q", "r", "s", "t", "u", "v", "w", "x", "y", "z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0", "-", "_", "."]
    return  text
        .map { $0 }
        .filter({
            minus.contains(String($0))
        })
        .map { String($0) }
}

func stepThree(_ textArray: [String]) -> [String] {
    var previous: String = ""
    var result: [String] = []
    for word in textArray {
        if previous == ".", word == previous {
            continue
        }
        previous = word
        result.append(word)
    }
    
    return result
}

func stepFour(_ textArray: [String]) -> [String] {
    var result = textArray
    if let firstWord = result.first, firstWord == "." {
        result.removeFirst()
    }
    
    if let lastWord = result.last, lastWord == "." {
        result.removeLast()
    }
    
    return result
}

func stepFive(_ textArray: [String]) -> [String] {
    return textArray.isEmpty ? ["a"] : textArray
}

func stepSix(_ textArray: [String]) -> [String] {
    var temp = textArray
    var result: [String] = []
    if temp.count > 15 {
        for _ in 0..<15 {
            result.append(temp.removeFirst())
        }
        return result
    } else {
        return temp
    }
}

func stepSeven(_ textArray: [String]) -> [String] {
    var result = textArray
    let count = 3 - textArray.count
    if count > 0 {
        guard let lastWord = result.last else {
            return result
        }
        for _ in 0..<count {
            result.append(lastWord)
        }
    }
    return result
}