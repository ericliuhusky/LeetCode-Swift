class Solution {
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let nums = nums.sorted()
        let n = nums.count
        
        var answer = 100000
        
        for a in 0..<n {
            if a > 0 && nums[a] == nums[a - 1] {
                continue
            }
            
            var b = a + 1
            var c = n - 1
            while b < c {
                let total = nums[a] + nums[b] + nums[c]
                
                if total == target {
                    return total
                }
                
                if total > target {
                    var t = c - 1
                    while b < t && nums[t] == nums[c] {
                        t -= 1
                    }
                    c = t
                } else {
                    var t = b + 1
                    while t < c && nums[t] == nums[b] {
                        t += 1
                    }
                    b = t
                }
                
                if abs(total - target) < abs(answer - target) {
                    answer = total
                }
            }
        }
        
        return answer
    }
}
