class Solution {
    func isValid(_ s: String) -> Bool {
        guard s.count % 2 == 0 else { return false }
        
        let pairs: [Character: Character] = [
            ")": "(",
            "}": "{",
            "]": "["
        ]
        
        var stack = [Character]()
        
        for c in s {
            if pairs.keys.contains(c) {
                guard
                    let top = stack.last,
                    top == pairs[c]
                else { return false }
                
                stack.removeLast()
            } else {
                stack.append(c)
            }
        }
        
        return stack.isEmpty
    }
}
