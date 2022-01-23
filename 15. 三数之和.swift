class Solution {
    func threeSum(_ nums: [Int]) -> [[Int]] {
        let nums = nums.sorted()
        let n = nums.count
        
        var answer = [[Int]]()
        
        for a in 0..<n {
            if a > 0 && nums[a] == nums[a - 1] {
                continue
            }
            
            var c = n - 1
            for b in (a + 1)..<n {
                if b > a + 1 && nums[b] == nums[b - 1] {
                    continue
                }
                
                let target = 0 - nums[a] - nums[b]
                
                while b < c && nums[c] > target {
                    c -= 1
                }
                
                if b == c {
                    break
                }
                
                if nums[c] == target {
                    answer.append([nums[a], nums[b], nums[c]])
                }
            }
        }
        
        return answer
    }
}
