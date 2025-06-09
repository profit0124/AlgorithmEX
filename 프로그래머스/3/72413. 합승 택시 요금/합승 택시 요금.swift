import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    let safeMaxNum = 100_000_000
    
    var dist = Array(repeating: Array(repeating: safeMaxNum, count: n + 1), count: n + 1)
    
    for i in 1...n {
        dist[i][i] = 0
    }
    
    for fare in fares {
        let from = fare[0]
        let to = fare[1]
        let cost = fare[2]
        
        dist[from][to] = cost
        dist[to][from] = cost
    }
    
    // 경유지 k, 시작지 i, 도착지 j
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if dist[i][k] < safeMaxNum && dist[k][j] < safeMaxNum {
                    dist[i][j] = min(dist[i][j], dist[i][k] + dist[k][j])
                }
            }
        }
    }
    
    var result = dist[s][a] + dist[s][b]
    
    for k in 1...n {
        let cost = dist[s][k] + dist[k][a] + dist[k][b]
        
        result = min(result, cost)
    }
    
    return result
}