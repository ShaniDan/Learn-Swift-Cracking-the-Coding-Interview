// =============================================================================
//  LESSON 15 — EXERCISES: the book's Chapter 2 problems
//  Every function receives the HEAD node (or nil for an empty list).
// =============================================================================

import Support

/// Warm-up: the number of nodes (use a loop).
func length(_ head: ListNode?) -> Int {
    todo()
    return -1
}

/// Warm-up (a classic!): reverse the list by re-pointing the next arrows;
/// return the NEW head. Use three variables: previous, current, next.
/// 1 → 2 → 3  becomes  3 → 2 → 1
func reverse(_ head: ListNode?) -> ListNode? {
    todo()
    return nil
}

/// 2.1 Remove Dups — remove duplicate values from an unsorted list, keeping
/// the first occurrence. Change the list in place.
/// 1 → 2 → 1 → 3 → 2   becomes   1 → 2 → 3
/// Book follow-up: how would you do it without a Set (no extra buffer)?
func removeDups(_ head: ListNode?) {
    todo()
}

/// 2.2 Return Kth to Last — the DATA of the kth-to-last node (k = 1 → the last).
/// 1 → 2 → 3 → 4, k = 2  →  3
/// Runner idea: move one pointer k steps ahead first, then move both together.
func kthToLast(_ head: ListNode?, _ k: Int) -> Int? {
    todo()
    return -1
}

/// 2.3 Delete Middle Node — you only get the node to delete (not the head!).
/// It's never the first or last node.
/// Trick: copy the NEXT node's data into this node, then skip the next node.
func deleteMiddleNode(_ node: ListNode) {
    todo()
}

/// 2.4 Partition — rearrange so all nodes with data < x come before all nodes
/// with data >= x. Order inside each part doesn't matter. Return the new head.
/// Idea: build a "before" list and an "after" list, then connect them.
func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    todo()
    return nil
}

/// 2.5 Sum Lists — each list is a number with digits in REVERSE order (ones
/// digit first). Return their sum as a new list in the same format.
/// (7 → 1 → 6) + (5 → 9 → 2) is 617 + 295 = 912  →  2 → 1 → 9
/// Add digit by digit with a carry, like on paper.
func sumLists(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
    todo()
    return nil
}

/// 2.6 Palindrome — true if the list reads the same both ways.  1 → 2 → 1 → true
func isPalindrome(_ head: ListNode?) -> Bool {
    todo()
    return false
}

/// 2.7 Intersection — two lists may share nodes from some point on (the SAME
/// node objects — compare with ===, not ==). Return the first shared node, or nil.
///     a: 3 → 1 → 5 ↘
///                    7 → 2 → 1
///     b:     4 → 6 ↗
/// Book idea: get both lengths, advance the longer one by the difference,
/// then walk both together until they meet.
func intersection(_ a: ListNode?, _ b: ListNode?) -> ListNode? {
    todo()
    return ListNode(-1)
}

/// 2.8 Loop Detection — if the list loops back on itself, return the node where
/// the loop starts; otherwise nil.
/// Use a Set<ObjectIdentifier> of visited nodes (ObjectIdentifier(node) gives a
/// node a hashable ID), or the book's fast/slow runner trick for O(1) space.
/// ⚠️ A plain "walk until nil" loop never ends on a looped list!
func loopStart(_ head: ListNode?) -> ListNode? {
    todo()
    return ListNode(-1)
}
