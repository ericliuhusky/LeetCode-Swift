class Solution {
    func letterCombinations(_ digits: String) -> [String] {
        guard !digits.isEmpty else { return [] }
        
        let digits = [Character](digits)
        
        let digitAlphabets: [Character: String] = [
            "2": "abc",
            "3": "def",
            "4": "ghi",
            "5": "jkl",
            "6": "mno",
            "7": "pqrs",
            "8": "tuv",
            "9": "wxyz"
        ]
        
        var combinations = [String]()
        var combination = ""
        
        func backtrace(digits: [Character], index: Int, combination: inout String, combinations: inout [String]) {
            if index == digits.count {
                combinations.append(combination)
                return
            }
            
            let digit = digits[index]
            let alphabets = digitAlphabets[digit]!
            for alphabet in alphabets {
                combination.append(alphabet)
                backtrace(digits: digits, index: index + 1, combination: &combination, combinations: &combinations)
                combination.removeLast()
            }
        }
        
        backtrace(digits: digits, index: 0, combination: &combination, combinations: &combinations)
        
        return combinations
    }
}
