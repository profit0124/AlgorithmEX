import Foundation


func solution(_ n:Int, _ t:Int, _ m:Int, _ timetable:[String]) -> String {
    var remainingSeats = n * m
    let basetimeString: String = "09:00"
    
    let formatter = DateFormatter()
    formatter.dateFormat = "HH:mm"

    func parseStringToDate(_ timeString: String) -> Date? {
        return formatter.date(from: timeString)
    }

    func parseDateToString(_ date: Date) -> String {
        return formatter.string(from: date)
    }
    
    guard let baseDate = parseStringToDate(basetimeString) else { return basetimeString }
    let calendar = Calendar.current
    var busTimes: [Date] = []
    for i in 0..<n {
        guard let date = calendar.date(byAdding: .minute, value: i * t, to: baseDate) else { continue }
        busTimes.append(date)
    }
    
    guard let lastBusTime = busTimes.last else { return basetimeString }
    // 탑승 가능 인원만 뽑아서 정렬
    let timetable = timetable.compactMap(parseStringToDate).filter { $0 <= lastBusTime }.sorted()
    // 탑승 가능 인원이 없으면 마지막 시간에 도착
    if timetable.isEmpty { return parseDateToString(lastBusTime) }
    var index: Int = 0
    
    for busTime in busTimes {
        for _ in 0..<m {
            remainingSeats -= 1
            let temp = timetable[index]
            if temp <= busTime {
                if remainingSeats == 0 {
                    guard let time = calendar.date(byAdding: .minute, value: -1, to: temp) else { return basetimeString }
                    return parseDateToString(time)
                }
                index += 1
                // index 가 넘어가면 이후 모든 버스에 탑승 가능
                if index == timetable.count { break }
            }
        }
        // index 가 넘어가면 이후 모든 버스에 탑승 가능
        if index == timetable.count { break }
    }

    return parseDateToString(busTimes.last!)
}