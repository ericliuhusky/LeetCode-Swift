class Solution {
    func longestPalindrome(_ s: String) -> String {
        let length = s.count
        
        guard length >= 2 else { return s }
        
        let s = [Character](s)
        
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: length), count: length)
        
        var maxLen = 1
        var begin = 0
        
        for len in 2...length {
            for i in 0..<length {
                let j = i + len - 1
                
                if j >= length {
                    break
                }
                
                if s[i] != s[j] {
                    dp[i][j] = false
                } else {
                    if j - i + 1 <= 3 {
                        dp[i][j] = true
                    } else {
                        dp[i][j] = dp[i + 1][j - 1]
                    }
                }
                
                if dp[i][j] && j - i + 1 > maxLen {
                    maxLen = j - i + 1
                    begin = i
                }
            }
        }
        
        return String(s[begin..<begin + maxLen])
    }
}
