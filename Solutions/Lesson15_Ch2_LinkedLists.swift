// Solutions for Lesson 15 (CtCI Chapter 2). Compare with the book on PDF page 220.
import Support

func length(_ head: ListNode?) -> Int {
    var count = 0
    var current = head
    while let node = current {
        count += 1
        current = node.next
    }
    return count
}

func reverse(_ head: ListNode?) -> ListNode? {
    var previous: ListNode? = nil
    var current = head
    while let node = current {
        let next = node.next
        node.next = previous
        previous = node
        current = next
    }
    return previous
}

func removeDups(_ head: ListNode?) {
    var seen = Set<Int>()
    var previous: ListNode? = nil
    var current = head
    while let node = current {
        if seen.contains(node.data) {
            previous?.next = node.next        // skip this node
        } else {
            seen.insert(node.data)
            previous = node
        }
        current = node.next
    }
}

func kthToLast(_ head: ListNode?, _ k: Int) -> Int? {
    var lead = head, trail = head
    for _ in 0..<k {
        guard let node = lead else { return nil }
        lead = node.next
    }
    while lead != nil {
        lead = lead?.next
        trail = trail?.next
    }
    return trail?.data
}

func deleteMiddleNode(_ node: ListNode) {
    guard let next = node.next else { return }
    node.data = next.data
    node.next = next.next
}

func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    let beforeHead = ListNode(0), afterHead = ListNode(0)    // dummy heads
    var before = beforeHead, after = afterHead
    var current = head
    while let node = current {
        current = node.next
        if node.data < x {
            before.next = node
            before = node
        } else {
            after.next = node
            after = node
        }
    }
    after.next = nil
    before.next = afterHead.next
    return beforeHead.next
}

func sumLists(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
    let dummy = ListNode(0)
    var tail = dummy
    var a = a, b = b, carry = 0
    while a != nil || b != nil || carry > 0 {
        let total = (a?.data ?? 0) + (b?.data ?? 0) + carry
        tail.next = ListNode(total % 10)
        tail = tail.next!
        carry = total / 10
        a = a?.next
        b = b?.next
    }
    return dummy.next
}

func isPalindrome(_ head: ListNode?) -> Bool {
    // Runner + stack: push the first half, then compare with the second half.
    var stack: [Int] = []
    var slow = head, fast = head
    while let f = fast, let fNext = f.next {
        stack.append(slow!.data)
        slow = slow?.next
        fast = fNext.next
    }
    if fast != nil { slow = slow?.next }     // odd length: skip the middle
    while let node = slow {
        if stack.removeLast() != node.data { return false }
        slow = node.next
    }
    return true
}

func intersection(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
    var longer = a, shorter = b
    var diff = length(a) - length(b)
    if diff < 0 {
        swap(&longer, &shorter)
        diff = -diff
    }
    for _ in 0..<diff { longer = longer?.next }
    while let l = longer, let s = shorter {
        if l === s { return l }
        longer = l.next
        shorter = s.next
    }
    return nil
}

func loopStart(_ head: ListNode?) -> ListNode? {
    var slow = head, fast = head
    repeat {
        guard let f = fast?.next?.next else { return nil }   // reached the end: no loop
        slow = slow?.next
        fast = f
    } while slow !== fast
    slow = head                    // the book's proof: the start is equally far from both
    while slow !== fast {
        slow = slow?.next
        fast = fast?.next
    }
    return slow
}
