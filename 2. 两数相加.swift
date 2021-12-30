/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var l1 = l1
        var l2 = l2
        var first: ListNode?
        var last: ListNode?

        var carry = 0

        while l1 != nil || l2 != nil {
            let n1 = l1?.val ?? 0
            let n2 = l2?.val ?? 0

            let sum = n1 + n2 + carry

            if first == nil {
                first = ListNode(sum % 10)
                last = first
            } else {
                last?.next = ListNode(sum % 10)
                last = last?.next
            }

            carry = sum / 10

            l1 = l1?.next
            l2 = l2?.next
        }

        if carry > 0 {
            last?.next = ListNode(carry)
        }

        return first
    }
}
