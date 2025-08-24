import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {

    var result: Set<[String]> = []
    var temp: [Int: [String]] = [:]

    func compare(_ lhs: String, _ rhs: String) -> Bool {
        var i = lhs.startIndex
        var j = rhs.startIndex

        while i != lhs.endIndex, j != rhs.endIndex {
            let lc = lhs[i]
            let rc = rhs[j]
            if rc != "*" && lc != rc { return false }
            lhs.formIndex(after: &i)
            rhs.formIndex(after: &j)
        }
        return i == lhs.endIndex && j == rhs.endIndex
    }

    for i in 0..<banned_id.count {
        let baseString = banned_id[i]
        var tempArray: [String] = []
        
        user_id.forEach {
            if compare($0, baseString) {
                tempArray.append($0)
            }
        }
        temp[i] = tempArray
    }

    func dfs(_ index: Int = 0, _ tempArray: [String] = []) {
        guard temp.count > index else {
            result.insert(tempArray.sorted())
            return
        }

        guard let ids = temp[index] else { return }
        for id in ids {
            if !tempArray.contains(id) {
                dfs(index + 1, tempArray + [id])
            }
        }
    }

    dfs()
    return result.count
}