import Foundation

func solution(_ babbling:[String]) -> Int {
    let availableBabbling = ["aya", "ye", "woo", "ma"]
    var result: Int = 0
    for word in babbling {
        var temp = word
        for availableBabble in availableBabbling {
            if word.contains(availableBabble + availableBabble) {
                continue
            }
            temp = temp.replacingOccurrences(of: availableBabble, with: " ")
            if temp.isEmpty {
                break
            }
        }
        temp = temp.replacingOccurrences(of: " ", with: "")
        if temp.isEmpty {
            result += 1
        }
    }
    return result
}