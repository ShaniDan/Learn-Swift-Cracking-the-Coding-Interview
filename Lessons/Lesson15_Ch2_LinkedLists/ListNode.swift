// The linked list node used in this lesson. Read it, but don't change it —
// the checks build lists with these helpers.

final class ListNode {
    var data: Int
    var next: ListNode?

    init(_ data: Int, next: ListNode? = nil) {
        self.data = data
        self.next = next
    }
}

/// Builds a linked list from an array and returns the head (nil for []).
///   makeList([3, 7, 1])  →  3 → 7 → 1 → nil
func makeList(_ values: [Int]) -> ListNode? {
    var head: ListNode? = nil
    for value in values.reversed() {
        head = ListNode(value, next: head)
    }
    return head
}

/// Turns a linked list back into an array — handy for printing and testing.
/// (Stops after 10,000 nodes in case a list accidentally loops forever.)
func toArray(_ head: ListNode?) -> [Int] {
    var out: [Int] = []
    var current = head
    while let node = current, out.count < 10_000 {
        out.append(node.data)
        current = node.next
    }
    return out
}
