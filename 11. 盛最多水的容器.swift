class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var answer = 0
        var left = 0
        var right = height.count - 1
        
        while left < right {
            answer = max(answer, (right - left) * min(height[left], height[right]))
            
            if height[left] <= height[right] {
                left += 1
            } else {
                right -= 1
            }
        }
        
        return answer
    }
}
