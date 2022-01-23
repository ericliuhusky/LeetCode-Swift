class Solution {
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        
        let first = [Character](strs[0])
        for i in 0..<first.count {
            for str in strs.dropFirst() {
                if i >= str.count || [Character](str)[i] != first[i] {
                    return String(first[0..<i])
                }
            }
        }
        
        return strs[0]
    }
}
