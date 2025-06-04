import Foundation

enum Direction: String {
    case E
    case W
    case N
    case S
    
    func getDirection() -> [Int] {
        switch self {
        case .E:
            return [0, 1]
        case .W:
            return [0, -1]
        case .N:
            return [-1, 0]
        case .S:
            return [1, 0]
        }
    }
}

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let maxRow = park.count
    let maxCol = park[0].count
    var robotPosition = findStartPosition(park)
    for route in routes {
        if firstCheck(robotPosition, route, maxRow, maxCol) {
            guard let new = secondCheck(robotPosition, route, park) else {
                continue
            }
            robotPosition = new
        }
    }
    return robotPosition
}

func findStartPosition(_ park: [String]) -> [Int] {
    var result: [Int] = [0, 0]
    for i in 0..<park.count {
        if park[i].contains("S") {
            let row = park[i].map { String($0) }
            for j in 0..<row.count {
                if row[j] == "S" {
                    return [i, j]
                }
            }
        }
    }
    return result
}


func firstCheck(_ robot: [Int], _ route:String, _ maxRow: Int, _ maxCol: Int) -> Bool {
    let routeArray = route.split(separator: " ")
    switch routeArray[0] {
    case "E":
        return robot[1] + Int(routeArray[1])! < maxCol
    case "W":
        return robot[1] - Int(routeArray[1])! >= 0
    case "N":
        return robot[0] - Int(routeArray[1])! >= 0
    case "S":
        return robot[0] + Int(routeArray[1])! < maxRow
    default:
        return true
    }
}

func secondCheck(_ robot: [Int], _ route: String, _ park: [String]) -> [Int]? {
    var result = robot
    let routeArray = route.split(separator: " ")
    guard let direction = Direction(rawValue: String(routeArray[0])) else {
        return nil
    }
    let distance = Int(routeArray[1])!
    for _ in 0..<distance {
        result = zip(result, direction.getDirection()).map { $0 + $1 }
        let row = park[result[0]].map { $0 }
        if row[result[1]] == "X" {
            return nil
        }
    }

    return result
}
