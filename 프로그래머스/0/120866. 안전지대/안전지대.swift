import Foundation

func solution(_ board:[[Int]]) -> Int {
    var n = board.count
    var result = n * n
    var row = 0
    var col = 0
    var dangerous: Set<[Int]> = []
    
    for i in 0..<board.count {
        for j in 0..<board[i].count {
            if board[i][j] == 1 {
                row = i
                col = j
                let areas = makeDangerousArea(col, row, n)
                for area in areas {
                    dangerous.insert(area)
                }
            }
        }
    }
    
    return result - dangerous.count
}

func makeDangerousArea(_ col: Int, _ row: Int, _ count: Int) -> [[Int]] {
    let minRow = row == 0 ? 0 : row - 1
    let maxRow = count - 1 <= row ? row : row + 1
    let minCol = col == 0 ? 0 : col - 1
    let maxCol = count - 1 <= col ? col : col + 1
    
    var result: [[Int]] = []
    for i in minRow...maxRow {
        for j in minCol...maxCol {
            result.append([i, j])
        }
    }
    return result
}

