class Solution {
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let totalLength = nums1.count + nums2.count
        
        if totalLength % 2 == 1 {
            let midIndex = totalLength / 2
            let median = Double(getKthElement(nums1, nums2, midIndex + 1))
            return median
        } else {
            let midIndex1 = totalLength / 2 - 1
            let midIndex2 = totalLength / 2
            let median = Double(getKthElement(nums1, nums2, midIndex1 + 1) + getKthElement(nums1, nums2, midIndex2 + 1)) / 2.0
            return median
        }
    }

    func getKthElement(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        var k = k
        
        let length1 = nums1.count
        let length2 = nums2.count
        
        var index1 = 0
        var index2 = 0
        
        while true {
            if index1 == length1 {
                return nums2[index2 + k - 1]
            }
            if index2 == length2 {
                return nums1[index1 + k - 1]
            }
            if k == 1 {
                return min(nums1[index1], nums2[index2])
            }
            
            let half = k / 2
            let newIndex1 = min(index1 + half, length1) - 1
            let newIndex2 = min(index2 + half, length2) - 1
            let pivot1 = nums1[newIndex1]
            let pivot2 = nums2[newIndex2]
            if pivot1 <= pivot2 {
                k -= (newIndex1 - index1 + 1)
                index1 = newIndex1 + 1
            } else {
                k -= (newIndex2 - index2 + 1)
                index2 = newIndex2 + 1
            }
        }
    }
}
