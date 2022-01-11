class Solution {
    func isMatch(_ s: String, _ p: String) -> Bool {
        let s = [Character](s)
        let p = [Character](p)
        
        let m = s.count
        let n = p.count
        
        var dp = [[Bool]](repeating: [Bool](repeating: false, count: n + 1), count: m + 1)
        
        dp[0][0] = true
        
        for i in 0...m {
            for j in 1...n {
                if p[j - 1] == "*" {
                    if i >= 1 && matches(s[i - 1], p[j - 2]) {
                        // abc abc*
                        // abcc abc*
                        // aaa aaa*
                        // ||
                        // ab abb*
                        dp[i][j] = dp[i - 1][j] || dp[i][j - 2]
                    } else {
                        // ab abc*
                        dp[i][j] = dp[i][j - 2]
                    }
                } else {
                    if i >= 1 && matches(s[i - 1], p[j - 1]) {
                        //abc abc
                        dp[i][j] = dp[i - 1][j - 1]
                    }
                }
            }
        }
        
        return dp[m][n]
    }
    
    func matches(_ sc: Character, _ pc: Character) -> Bool {
        if pc == "." {
            return true
        }
        
        return sc == pc
    }
}
