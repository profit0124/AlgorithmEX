import Foundation

func solution(_ n: Int, _ results: [[Int]]) -> Int {
    // 2차원 배열로 직접 승부 관계 표현
    var canDefeat = Array(repeating: Array(repeating: false, count: n + 1), count: n + 1)
    
    // 직접 승부 결과 기록
    for result in results {
        canDefeat[result[0]][result[1]] = true
    }
    
    // Floyd-Warshall: 모든 간접 관계 계산
    // k를 거쳐서 i가 j를 이길 수 있는지 확인
    for k in 1...n {
        for i in 1...n {
            for j in 1...n {
                if canDefeat[i][k] && canDefeat[k][j] {
                    canDefeat[i][j] = true
                }
            }
        }
    }
    
    // 각 선수별로 순위를 정확히 알 수 있는지 확인
    var answer = 0
    for i in 1...n {
        var totalRelations = 0
        for j in 1...n {
            if i != j && (canDefeat[i][j] || canDefeat[j][i]) {
                totalRelations += 1
            }
        }
        if totalRelations == n - 1 {
            answer += 1
        }
    }
    
    return answer
}