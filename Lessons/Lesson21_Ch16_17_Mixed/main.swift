// =============================================================================
//  LESSON 21 — Mixed practice: CtCI Chapters 16 (Moderate) & 17 (Hard)
// =============================================================================
//  📖 Moderate questions:  PDF page 193      ✅ solutions: PDF page 474
//  📖 Hard questions:      PDF page 198      ✅ solutions: PDF page 542
//  💡 Hints:               PDF page 691
//
//  No lecture this time — you have every tool you need. These problems don't
//  tell you WHICH technique to use; spotting that is the real interview skill.
//  For each one, before coding:
//     • Write the brute-force idea and its Big O in a comment.
//     • Ask: would a Set/Dictionary help? Sorting? Two pointers? Recursion + memo?
//     • Then write the better version.
//
//  Toolbox recap:
//     Set / Dictionary (L09)     two pointers (L08, L13)     sorting (L10, L20)
//     binary search (L20)        recursion + memo (L19)      stack / queue (L16)
//     classes with pointers (L15 linked lists — useful for 16.25 LRU Cache!)
// =============================================================================


// --- A tiny warm-up: Kadane's idea (used in 16.17) ---------------------------------------------
//  Keep a running sum; if it ever drops below zero, starting fresh is better.

let sample = [2, -8, 3, -2, 4, -10]
var running = 0
for x in sample {
    running = max(x, running + x)
    print("at \(x): best run ending here = \(running)")
}


// --- A tiny warm-up: a doubly linked node (used in the book's 16.25 LRU Cache) -----------------

final class DNode {
    let key: Int
    var value: Int
    var prev: DNode?
    var next: DNode?
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
    }
}
//  A dictionary [key: DNode] gives O(1) lookup; the doubly linked list keeps
//  usage order with O(1) move-to-front and remove-from-back.
let demoNode = DNode(key: 1, value: 100)
print("DNode(key: \(demoNode.key), value: \(demoNode.value))")
