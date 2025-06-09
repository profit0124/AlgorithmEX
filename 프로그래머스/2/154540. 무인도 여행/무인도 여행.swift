import Foundation

func solution(_ maps:[String]) -> [Int] {
    let row = maps.count
    let col = maps[0].count
    var visited = Array(repeating: Array(repeating: false, count: col), count: row)
    let maps = maps.map { $0.map{ String($0) }}
    var result: [Int] = []
    
    func dfs(_ i: Int, _ j: Int) -> Int {
        if i < 0 || i >= row || j < 0 || j >= col || visited[i][j] || maps[i][j] == "X" {
            return 0
        }
        visited[i][j] = true
        return Int(maps[i][j])! + dfs(i-1, j) + dfs(i+1, j) + dfs(i, j-1) + dfs(i, j+1)
    }
    
    for i in 0..<row {
        for j in 0..<col {
            if !visited[i][j] && maps[i][j] != "X" {
                result.append(dfs(i, j))
            }
        }
    }
    
    result = result.sorted()
    return result.isEmpty ? [-1] : result
}