import Foundation

func solution(_ sales:[Int], _ links:[[Int]]) -> Int {
    
    var graph: [Int: [Int]] = [:]
    var result: Int = Int.max
    
    var memoization: [Int: (Int, Int)] = [:]

    links.forEach({
        graph[$0[0], default: []].append($0[1])
    })
    
    func calculateNode(_ node: Int) -> (Int, Int) {
        if let value = memoization[node] {
            return value
        }
        guard let members = graph[node] else {
            let value = (sales[node-1], 0)
            memoization[node] = value
            return value
        }
        
        var leaderSkips: Int = Int.max
        for i in 0..<members.count {
            var newMembers = members
            let attedenceNode = newMembers.remove(at: i)
            var tempResult = calculateNode(attedenceNode).0
            newMembers.forEach({
                let value = calculateNode($0)
                tempResult += min(value.0, value.1)
            })
            leaderSkips = min(leaderSkips, tempResult)
        }
        
        var leaderAttends: Int = sales[node-1]
        members.forEach({
            let value = calculateNode($0)
            leaderAttends += min(value.0, value.1)
        })
        memoization[node] = (leaderAttends, leaderSkips)
        return (leaderAttends, leaderSkips)
    }
    
    let (leaderAttends, leaderSkips) = calculateNode(1)
    result = min(leaderAttends, leaderSkips)
    
    return result
}