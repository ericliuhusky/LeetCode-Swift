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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        withDummy(head) { dummy in
            let nthFromStart = getCount(dummy) - n + 1
            let indexFromStart = nthFromStart - 1
            let indexBeforeNth = indexFromStart - 1
            
            var current = dummy
            for _ in 0..<indexBeforeNth {
                current = current?.next
            }
            
            current?.next = current?.next?.next
        }
    }

    func getCount(_ head: ListNode?) -> Int {
        var current = head
        var count = 0
        
        while current != nil {
            count += 1
            
            current = current?.next
        }
        
        return count
    }
    
    func withDummy(_ head: ListNode?, block: (ListNode?) -> Void) -> ListNode? {
        let dummy: ListNode? = ListNode(0, head)
        block(dummy)
        return dummy?.next
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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        withDummy(head) { dummy in
            var first = head
            var second = dummy
            
            for _ in 0..<n {
                first = first?.next
            }
            
            while first != nil {
                first = first?.next
                second = second?.next
            }
            
            second?.next = second?.next?.next
        }
    }
    
    func withDummy(_ head: ListNode?, block: (ListNode?) -> Void) -> ListNode? {
        let dummy: ListNode? = ListNode(0, head)
        block(dummy)
        return dummy?.next
    }
}
