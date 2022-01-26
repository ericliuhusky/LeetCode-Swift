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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        let first = ListNode()
        
        var last: ListNode? = first
        var cur1 = list1
        var cur2 = list2
        
        while cur1 != nil && cur2 != nil {
            if cur1!.val <= cur2!.val {
                last?.next = cur1
                cur1 = cur1?.next
            } else {
                last?.next = cur2
                cur2 = cur2?.next
            }
            
            last = last?.next
        }
        
        last?.next = cur1 ?? cur2
        
        return first.next
    }
}


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
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        if list1 == nil {
            return list2
        } else if list2 == nil {
            return list1
        } else if list1!.val <= list2!.val {
            list1?.next = mergeTwoLists(list1?.next, list2)
            return list1
        } else {
            list2?.next = mergeTwoLists(list1, list2?.next)
            return list2
        }
    }
}
