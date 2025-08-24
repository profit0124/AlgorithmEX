import Foundation

func solution(_ lines:[String]) -> Int {
    var result: Int = 0
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
    formatter.locale = Locale(identifier: "en_US_POSIX")
    formatter.timeZone = TimeZone(secondsFromGMT: 0)

    func parseLog(_ log: String) -> (start: Int, end: Int)? {
        let parts = log.split(separator: " ")
        guard parts.count == 3 else { return nil }

        let dateTime = parts[0] + " " + parts[1]
        let durationString = parts[2]

        guard let endDate = formatter.date(from: String(dateTime)) else { return nil }

        let durationSec = Double(durationString.dropLast()) ?? 0.0

        let endMs = Int(endDate.timeIntervalSince1970 * 1000)
        let startMs = endMs - Int(durationSec * 1000) + 1

        return (startMs, endMs)
    }

    let parsedLogs: [(Int, Int)] = lines.compactMap {
        parseLog($0)
    }

    for parsedLog in parsedLogs {
        let start = parsedLog.1 - 1
        let end = start + 1000
        let count = parsedLogs.filter {
            ($0.0 > start && $0.0 <= end) ||
            ($0.1 > start && $0.1 <= end) ||
            ($0.0 <= start && $0.1 >= end)
        }.count
        result = max(count, result)
    }

    return result
}