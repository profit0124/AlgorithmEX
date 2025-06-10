import Foundation

func solution(_ info:[Int], _ edges:[[Int]]) -> Int {
    var graph: [Int: [Int]] = [:]
    
    var result: Int = 0
    
    for edge in edges {
        graph[edge[0], default: []].append(edge[1])
    }
    
    func backtracking(_ visited: Set<Int>, sheeps: Int, wolfs: Int) {
        if sheeps == wolfs { return }
        
        result = max(result, sheeps)
        
        var availableNodes = Set<Int>()
        for visitNode in visited {
            if let neighbors = graph[visitNode] {
                for neighbor in neighbors where !visited.contains(neighbor) {
                    availableNodes.insert(neighbor)
                }
            }
        }
        
        for availableNode in availableNodes {
            var newVisited = visited
            newVisited.insert(availableNode)
            
            let newSheeps = sheeps + (info[availableNode] == 0 ? 1 : 0)
            let newWolfs = wolfs + (info[availableNode] == 1 ? 1 : 0)
            
            backtracking(newVisited, sheeps: newSheeps, wolfs: newWolfs)
        }
    }
    
    backtracking([0], sheeps: 1, wolfs: 0)
    
    return result
}