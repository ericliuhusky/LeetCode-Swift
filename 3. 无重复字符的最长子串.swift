class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {       
        let s = [Character](s)

        var result = 0

        var window = Set<Character>()

        var right = -1
        for left in 0..<s.count {
            if left != 0 {
                window.remove(s[left - 1])
            }
            
            while (right + 1) < s.count && !window.contains(s[right + 1]) {
                window.insert(s[right + 1])
                right += 1
            }
            
            result = max(result, right - left + 1)
        }

        return result
    }
}
