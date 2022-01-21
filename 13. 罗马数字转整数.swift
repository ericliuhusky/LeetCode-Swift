class Solution {
    func romanToInt(_ s: String) -> Int {
        let s = [Character](s)
        var answer = 0
        
        let symbolValues = [
            "M": 1000,
            "CM": 900,
            "D": 500,
            "CD": 400,
            "C": 100,
            "XC": 90,
            "L": 50,
            "XL": 40,
            "X": 10,
            "IX": 9,
            "V": 5,
            "IV": 4,
            "I": 1
        ]
        
        var i = 0
        while i < s.count {
            if i + 1 < s.count,
                let value = symbolValues[String(s[i]) + String(s[i + 1])] {
                answer += value
                i += 2
            } else if let value = symbolValues[String(s[i])] {
                answer += value
                i += 1
            }
        }
        
        return answer
    }
}
