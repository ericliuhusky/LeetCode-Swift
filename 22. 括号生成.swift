class Solution {
    func generateParenthesis(_ n: Int) -> [String] {
        var result = [String]()
        generateAll("", 2 * n, result: &result)
        return result
    }
    
    func generateAll(_ current: String, _ index: Int, result: inout [String]) {
        if index == 0 {
            if valid(current) {
                result.append(current)
            }
            return
        }
        
        generateAll(current + "(", index - 1, result: &result)
        generateAll(current + ")", index - 1, result: &result)
    }
    
    func valid(_ current: String) -> Bool {
        var stack = 0
        for c in current {
            if c == ")" {
                if stack <= 0 {
                    return false
                }
                stack -= 1
            } else {
                stack += 1
            }
        }
        
        return stack == 0
    }
}
