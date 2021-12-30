class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict = [Int: Int]()

        for i in 0..<nums.count {
            if let matchedIndex = dict[target - nums[i]] {
                return [matchedIndex, i]
            }

            dict[nums[i]] = i
        }

        return []
    }
}
