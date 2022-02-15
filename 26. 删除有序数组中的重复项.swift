class Solution {
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        
        var i = 1
        var j = 1
        while i < nums.count {
            if nums[i] != nums[i - 1] {
                nums[j] = nums[i]
                j += 1
            }
            
            i += 1
        }
        
        return j
    }
}
