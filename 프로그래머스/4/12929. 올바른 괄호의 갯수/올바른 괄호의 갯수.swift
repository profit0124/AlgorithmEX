import Foundation

func solution(_ n:Int) -> Int {

    var result: Int = 0

    func dfs(open: Int, close: Int, openStack: Int) {
        guard open >= 0, close >= 0 else { return }
        if open == 0 {
            if close == openStack {
                result += 1
            }
            return
        }

        if openStack > 0 {
            dfs(open: open - 1, close: close, openStack: openStack + 1)
            dfs(open: open, close: close - 1, openStack: openStack - 1)
        } else {
            dfs(open: open - 1, close: close, openStack: openStack + 1)
        }
    }

    dfs(open: n, close: n, openStack: 0)

    return result
}
