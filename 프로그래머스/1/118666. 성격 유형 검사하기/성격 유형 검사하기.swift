import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    let personalityTypes: [[String]] = [
        ["R", "T"],  // 1번 지표: 라이언형, 튜브형
        ["C", "F"],  // 2번 지표: 콘형, 프로도형
        ["J", "M"],  // 3번 지표: 제이지형, 무지형
        ["A", "N"]   // 4번 지표: 어피치형, 네오형
    ]
    var scores: [String: Int] = [:]
    var result: String = ""
    for i in 0..<survey.count {
        var text = ""
        var score: Int = 0
        switch choices[i] {
        case 1:
            text = String(survey[i].prefix(1))
            score = 3
        case 2:
            text = String(survey[i].prefix(1))
            score = 2
        case 3:
            text = String(survey[i].prefix(1))
            score = 1
        case 5:
            text = String(survey[i].suffix(1))
            score = 1
        case 6:
            text = String(survey[i].suffix(1))
            score = 2
        case 7:
            text = String(survey[i].suffix(1))
            score = 3
        default:
            break
        }
        scores[text, default: 0] += score
    }
    
    for personalityType in personalityTypes {
        let firstScore: Int = scores[personalityType[0]] ?? 0
        let secondScore: Int = scores[personalityType[1]] ?? 0
        
        result += firstScore >= secondScore ? personalityType[0] : personalityType[1]
    }

    return result
}

