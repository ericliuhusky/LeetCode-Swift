class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        guard x >= 0 else { return false }
        
        if x != 0 && x % 10 == 0 {
            return false
        }
        
        var x = x
        var reversed = 0
        while x > reversed {
            reversed = reversed * 10 + x % 10
            x /= 10
        }
        
        return x == reversed || x == reversed / 10
    }
}
