// =============================================================================
//  LESSON 15 — CtCI Chapter 2: Linked Lists
// =============================================================================
//  📖 READ FIRST:   Chapter 2 intro + questions     PDF page 104
//  ✅ SOLUTIONS:    PDF page 220
//  The ListNode class and the makeList / toArray helpers are in ListNode.swift.
//
//  A linked list is a chain of nodes. Each node holds data and a pointer to
//  the next node. The last node points to nil.
//
//      head
//       ↓
//     [ 3 | •]──→[ 7 | •]──→[ 1 | nil]
//
//  vs. an Array: no instant access by index (reaching item k takes k steps,
//  O(k)), but inserting/removing at a node you already have is O(1).
//
//  Swift note: ListNode is a CLASS (Lesson 11), so nodes are shared, not
//  copied — exactly what linked lists need. "next" is an optional because the
//  last node has no next.
// =============================================================================


// --- Technique 1: walking the list ------------------------------------------------------------

let list = makeList([3, 7, 1])
var current = list
while let node = current {
    print(node.data, terminator: " → ")
    current = node.next
}
print("nil")


// --- Technique 2: deleting = make the previous node skip over it ---------------------------------
//     previous.next = previous.next?.next
//  A "dummy" node in front of the head avoids special cases when the head itself changes:

func removeAll(_ value: Int, from head: ListNode?) -> ListNode? {
    let dummy = ListNode(0, next: head)
    var previous = dummy
    while let next = previous.next {
        if next.data == value {
            previous.next = next.next       // skip it
        } else {
            previous = next
        }
    }
    return dummy.next
}
print(toArray(removeAll(1, from: makeList([1, 2, 1, 3]))))   // [2, 3]


// --- Technique 3: the "runner" — two pointers at different speeds (book PDF page 105) ------------
//  slow moves 1 step, fast moves 2. When fast reaches the end, slow is in the middle.

func middleValue(_ head: ListNode?) -> Int? {
    var slow = head, fast = head
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow?.data
}
print(middleValue(makeList([1, 2, 3, 4, 5])) as Any)      // Optional(3)


// --- Technique 4: recursion ---------------------------------------------------------------------

func lengthRecursive(_ node: ListNode?) -> Int {
    guard let node else { return 0 }
    return 1 + lengthRecursive(node.next)
}
print(lengthRecursive(makeList([4, 5, 6])))                 // 3


// --- Identity: === ----------------------------------------------------------------------------------
//  Two different nodes can hold the same data. To ask "is this the SAME node
//  object?", use ===  (needed for 2.7 Intersection and 2.8 Loop Detection).

let n1 = ListNode(5), n2 = ListNode(5)
print(n1.data == n2.data, n1 === n2, n1 === n1)             // true false true

print("\nDraw boxes and arrows on paper for every problem. Everyone does! ✏️")
