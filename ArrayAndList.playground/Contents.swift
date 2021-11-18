import UIKit

// array
var array = [3, 1, 3, 5, 4, 9, 7, 2]
// insert
array.insert(6, at: 0)
// delete
array.remove(at: 3)
// add
array.append(10)

// List
class ListNode {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

class List {
    var head: ListNode?
    var tail: ListNode?

    //head insert
    func appendedToHead(_ val: Int) {
        if tail == nil {
            head = ListNode(val)
            tail = head
        }
        let tmp = ListNode(val)
        tail?.next = head
        head?.next = tmp
    }

    func appendedToTail(_ val: Int) {
        if tail == nil {
            tail = ListNode(val)
            head = tail
        }
        let tmp = ListNode(val)
        tail?.next = tmp
        head = tail?.next
    }
}
//
