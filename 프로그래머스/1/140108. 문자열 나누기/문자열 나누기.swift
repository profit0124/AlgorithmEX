import Foundation

func solution(_ s:String) -> Int {
    var basisText: String = ""
    var basisTextCount: Int = 0
    var otherTextCount: Int = 0
    var result: [String] = []
    var temp: String = ""
    
    for char in s {
        let string: String = String(char)
        if temp.isEmpty {
            basisText = string
        }
        
        if basisText == string {
            basisTextCount += 1
        } else {
            otherTextCount += 1
        }
        
        temp += string
        
        if otherTextCount == basisTextCount {
            result.append(temp)
            temp = ""
            basisTextCount = 0
            otherTextCount = 0
        }
    }
    
    if !temp.isEmpty {
        result.append(temp)
    }
    
    return result.count
}