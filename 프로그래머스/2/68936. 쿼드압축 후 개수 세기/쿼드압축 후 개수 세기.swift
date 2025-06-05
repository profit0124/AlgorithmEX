import Foundation

func solution(_ arr:[[Int]]) -> [Int] {
    var result: [Int] = [0, 0]
    
    func quadTree(_ arr: [[Int]]) {
        let count = arr.count
        
        let sum = arr.flatMap({ $0 }).reduce(0) { $0 + $1 }
        if sum == count * count {
            result[1] += 1
        } else if sum == 0 {
            result[0] += 1
        } else {
            var quadTreeArray: [String:[[Int]]] = [
                "nw" : [],
                "ne" : [],
                "sw" : [],
                "se" : []
            ]
            
            for i in 0..<count {
                let rowString = i < count/2 ? "n" : "s"
                let row = arr[i]
                var left: [Int] = []
                var right: [Int] = []
                for j in 0..<count {
                    if j < count/2 {
                        left.append(row[j])
                    } else {
                        right.append(row[j])
                    }
                }
                
                let firstDictKey = rowString + "w"
                quadTreeArray[firstDictKey, default: []].append(left)
                
                let secondDictKey = rowString + "e"
                quadTreeArray[secondDictKey, default: []].append(right)
            }
            
            for (_, value) in quadTreeArray {
                quadTree(value)
            }
        }
    }
    
    quadTree(arr)
    return result
}
