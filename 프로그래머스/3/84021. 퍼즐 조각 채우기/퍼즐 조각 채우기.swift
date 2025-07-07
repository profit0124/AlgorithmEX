import Foundation

struct Position: Hashable, Equatable {
    let x: Int
    let y: Int
}

enum RotationAngle: CaseIterable {
    case angle0
    case angle90
    case angle180
    case angle270
    
    func rotated(_ position: Position) -> Position {
        switch self {
        case .angle0:
            return position
        case .angle90:
            return Position(x: position.y, y: -position.x)
        case .angle180:
            return Position(x: -position.x, y: -position.y)
        case .angle270:
            return Position(x: -position.y, y: position.x)
        }
    }
}

func solution(_ game_board:[[Int]], _ table:[[Int]]) -> Int {
    
    var spaces: [Position: [Position]] = [:]
    var availableBlocks: [Position: [Position]] = [:]
    
    var visitedGameboard: Set<Position> = []
    var visitedTable: Set<Position> = []
    
    var result: Int = 0
    
    // block 모양 계산
    func calcBlocks(_ base: Position, _ basisNum: Int,_ current: Position, _ blocks: inout [Position: [Position]], _ visited: inout Set<Position>, board: [[Int]]) {
        if visited.contains(current) {
            return
        }
        visited.insert(current)
        
        if board[current.x][current.y] != basisNum {
            return
        }

        blocks[base, default: []].append(Position(x: current.x, y: current.y))
        
        if current.x > 0 {
            calcBlocks(base, basisNum, Position(x: current.x - 1, y: current.y), &blocks, &visited, board: board)
        }
        
        if current.x < game_board.count - 1 {
            calcBlocks(base, basisNum, Position(x: current.x + 1, y: current.y), &blocks, &visited, board: board)
        }
        
        if current.y > 0 {
            calcBlocks(base, basisNum, Position(x: current.x, y: current.y - 1), &blocks, &visited, board: board)
        }
        
        if current.y < game_board[current.x].count - 1 {
            calcBlocks(base, basisNum, Position(x: current.x, y: current.y + 1), &blocks, &visited, board: board)
        }
    }
    
    func changeBase(_ block: [Position]) -> Set<Position> {
        var minX = Int.max
        var minY = Int.max
        
        for position in block {
            if position.x < minX {
                minX = position.x
            }
            if position.y < minY {
                minY = position.y
            }
        }
        return Set(block.map { Position(x: $0.x - minX, y: $0.y - minY )})
    }
    
    for i in 0..<game_board.count {
        for j in 0..<game_board[i].count {
            let position = Position(x: i, y: j)
            calcBlocks(position, 0, position, &spaces, &visitedGameboard, board: game_board)
        }
    }
    
    for i in 0..<table.count {
        for j in 0..<table[i].count {
            let position = Position(x: i, y: j)
            calcBlocks(position, 1, position, &availableBlocks, &visitedTable, board: table)
        }
    }
    
    spaces.forEach({ space in
        let space = changeBase(space.value)
        let count = space.count
        let testBlocks = availableBlocks.filter { $0.value.count ==  count }
        for testBlock in testBlocks {
            let block = changeBase(testBlock.value)
            var isMatch: Bool = false
            
            for angle in RotationAngle.allCases {
                let rotatedBlock = block.map { angle.rotated($0) }
                let newTestBlock = changeBase(rotatedBlock)
                if space == newTestBlock {
                    isMatch = true
                    break
                }
            }
            
            if isMatch {
                result += count
                availableBlocks.removeValue(forKey: testBlock.key)
                break
            }
        }
    })
    
    return result
}