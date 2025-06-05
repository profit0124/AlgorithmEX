import Foundation

func solution(_ expression:String) -> Int64 {
    var totalComputes:[[String]] = []
    var result: Int64 = .min
    
    func generateCombination(_ computes: [String], _ madeCompute: [String]) {
        if computes.count == 1, let compute = computes.first {
            var madeComputes = madeCompute
            madeComputes.append(compute)
            totalComputes.append(madeComputes)
            return
        }
        
        for i in 0..<computes.count {
            var temp = computes
            let compute = temp.remove(at: i)
            var madeComputes = madeCompute
            madeComputes.append(compute)
            generateCombination(temp, madeComputes)
        }
    }
    
    func iter(_ expression: String, _ computes: [String]) -> Int64 {
        if computes.count == 1, let compute = computes.first {
            let numbers = expression.components(separatedBy: compute).map { Int64($0)! }
            return calc(numbers, compute)
        }
        
        var computes = computes
        let compute = computes.removeFirst()
        
        let numbers: [Int64] = expression.components(separatedBy: compute).map { component in
            if let number = Int64(component) {
                return number
            } else {
                return iter(component, computes)
            }
        }
        
        return calc(numbers, compute)
    }
    
    generateCombination(["+", "-", "*"], [])
    
    for totalCompute in totalComputes {
        result = max(abs(iter(expression, totalCompute)), result)
    }
    
    return result
}

func calc(_ numbers: [Int64], _ compute: String) -> Int64 {
    switch compute {
    case "+":
        return numbers.reduce(0) { $0 + $1 }
    case "-":
        return numbers.reduce((numbers.first ?? 0) * 2) { $0 - $1 }
    default:
        return numbers.reduce(1) { $0 * $1 }
        
    }
}
