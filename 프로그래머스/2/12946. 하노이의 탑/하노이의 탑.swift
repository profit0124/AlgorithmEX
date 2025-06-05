import Foundation

func solution(_ n:Int) -> [[Int]] {
    
    var result: [[Int]] = []
    
    func hanoi(n: Int, _ from: Int, _ to: Int, _ middle: Int) {
        if n == 1 {
            result.append([from, to])
            return
        }
        
        hanoi(n: n-1, from, middle, to)
        
        result.append([from, to])
        
        hanoi(n: n-1, middle, to, from)
    }
    
    hanoi(n: n, 1, 3, 2)
    
    return result
}