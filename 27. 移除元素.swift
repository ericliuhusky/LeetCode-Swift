class Solution {
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0
        var j = 0
        while i < nums.count {
            if nums[i] != val {
                nums[j] = nums[i]
                j += 1
            }
            
            i += 1
        }
        
        return j
    }
}
