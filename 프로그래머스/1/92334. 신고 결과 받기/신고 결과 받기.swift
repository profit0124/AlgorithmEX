import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var result: [Int] = []
    var reportedCount: [String: [String]] = [:]
    var successCount: [String: Int] = [:]
    
    report.forEach {
        let list = $0.split(separator: " ").map { String($0) }
        reportedCount[list[1], default: []].append(list[0])
    }
    
    for (key, value) in reportedCount {
        let removedValue = Set(value)
        if removedValue.count >= k {
            removedValue.forEach {
                successCount[$0, default: 0] += 1
            }
        }
    }
    
    return id_list.map { successCount[$0] ?? 0}
}
