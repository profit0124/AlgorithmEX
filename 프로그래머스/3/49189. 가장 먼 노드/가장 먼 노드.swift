import Foundation

func solution(_ n:Int, _ edge:[[Int]]) -> Int {
    var graph: [Int: [Int]] = [:]
    var distances: [Int: Int] = [1: 0]
    
    edge.forEach {
        graph[$0[0], default: []].append($0[1])
        graph[$0[1], default: []].append($0[0])
    }
    
    var maxDistance: Int = 0
    
    func bfs(_ start: Int) {
        var queue: [Int] = [start]
        var visited: Set<Int> = [start]
        var currentIndex = 0
        
        while currentIndex < queue.count {
            let node = queue[currentIndex]
            guard let currentDistance = distances[node] else {
                break
            }
            if currentDistance > maxDistance {
                maxDistance = currentDistance
            }
            
            currentIndex += 1
            
            for neighbor in graph[node] ?? [] {
                if !visited.contains(neighbor) {
                    queue.append(neighbor)
                    visited.insert(neighbor)
                    distances[neighbor] = currentDistance + 1
                }
            }
        }
    }
    
    bfs(1)
    
    return distances.filter { $0.value == maxDistance }.count
}