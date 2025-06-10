import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    if !words.contains(target) {
        return 0
    }
    
    var result: Int = Int.max
    
    func checkSameWord(_ word1: String, _ word2: String) -> Int {
        var result = 0
        for (c1, c2) in zip(word1, word2) where c1 != c2 {
            result += 1
        }
        return result
    }
    
    func dfs(_ word: String, words:[String], count: Int) {
        if word == target {
            result = min(count, result)
        }
        
        if words.isEmpty || count > result {
            return
        }
        
        for index in 0..<words.count {
            var newWords = words
            let newWord = newWords.remove(at: index)
            let sameWordCount = checkSameWord(word, newWord)
            if sameWordCount == 1 {
                dfs(newWord, words: newWords, count: count + 1)
            }
        }
    }

    dfs(begin, words: words, count: 0)
    
    return result == Int.max ? 0 : result
}