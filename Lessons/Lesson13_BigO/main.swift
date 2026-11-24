// =============================================================================
//  LESSON 13 — Big O: how fast is your code?
// =============================================================================
//  📖 READ: CtCI Chapter VI "Big O" (PDF page 58) — the most important chapter
//  for the coding part of interviews. This lesson summarizes it in Swift.
//
//  Big O describes how the RUNNING TIME grows as the INPUT SIZE (n) grows.
//  Not seconds — the SHAPE of the growth.
// =============================================================================

import Foundation


// --- 1. The common ones, fastest to slowest ----------------------------------------------------
//
//   O(1)        constant      dict lookup, array[i], append         n = 1,000,000 → 1 step
//   O(log n)    logarithmic   binary search (halve each time)       → ~20 steps
//   O(n)        linear        one loop over the input               → 1,000,000 steps
//   O(n log n)  "n log n"     good sorting (sorted(), merge sort)   → ~20,000,000
//   O(n²)       quadratic     a loop inside a loop over the input   → 1,000,000,000,000 😱
//   O(2ⁿ)       exponential   trying every subset                   → forget it


// --- 2. How to figure it out ---------------------------------------------------------------------

func firstItem(_ items: [Int]) -> Int {     // O(1): same work no matter the size
    return items[0]
}

func sum(_ items: [Int]) -> Int {           // O(n): touches each item once
    var total = 0
    for x in items { total += x }
    return total
}

func allPairs(_ items: [Int]) -> Int {      // O(n²): for EACH item, loop over ALL items
    var count = 0
    for _ in items {
        for _ in items { count += 1 }
    }
    return count
}

func halvings(_ n: Int) -> Int {            // O(log n): n is cut in half each step
    var n = n, steps = 0
    while n > 1 { n /= 2; steps += 1 }
    return steps
}


// --- 3. The rules from the book ------------------------------------------------------------------------
//
//  RULE 1 — Drop constants.          O(2n) → O(n). Two loops one after another are still O(n).
//  RULE 2 — Drop smaller terms.      O(n² + n) → O(n²).
//  RULE 3 — Different inputs, different letters!
//       for a in A { ... }          for a in A {
//       for b in B { ... }              for b in B { ... }
//                                    }
//       → O(A + B)  (one after the other: ADD)     → O(A × B)  (nested: MULTIPLY)
//  RULE 4 — Recursion with 2 calls per level, n levels deep → O(2ⁿ). ("branches ^ depth")
//  RULE 5 — Space counts too. Making a new array of size n = O(n) extra space.


// --- 4. Hidden loops in Swift ⚠️ ---------------------------------------------------------------------------
//  These look like one step but are really loops:
//     array.contains(x)          O(n)  — searches the whole array
//     set.contains(x)            O(1)  ✓ hash table
//     dict[key]                  O(1)  ✓
//     array.firstIndex(of: x)    O(n)
//     array.insert(x, at: 0)     O(n)  — shifts everything over
//     array.removeFirst()        O(n)  — same
//     array.sorted()             O(n log n)
//     string.count               O(n)! — Swift walks the string to count characters
//     Array(string)              O(n)  — fine ONCE, at the start; not inside a loop
//     string.index(i, offsetBy: k)  O(k) — that's why we convert to Array first


// --- 5. See it with your own eyes ------------------------------------------------------------------------

func hasDupSlow(_ nums: [Int]) -> Bool {    // O(n²)
    for i in 0..<nums.count {
        for j in (i + 1)..<nums.count where nums[i] == nums[j] {
            return true
        }
    }
    return false
}

func hasDupFast(_ nums: [Int]) -> Bool {    // O(n) — uses a Set
    return Set(nums).count != nums.count
}

for n in [1_000, 2_000, 4_000] {
    let data = Array(0..<n)                 // no duplicates = worst case
    var start = Date()
    _ = hasDupSlow(data)
    let slow = Date().timeIntervalSince(start)
    start = Date()
    _ = hasDupFast(data)
    let fast = Date().timeIntervalSince(start)
    print(String(format: "n=%5d   slow: %.4fs   fast: %.6fs", n, slow, fast))
}
//  Doubling n → the slow one takes ~4× longer (n²). The fast one ~2× (n).


// --- 6. The book's optimization trick: "BUD" (Chapter VII, PDF page 72) ------------------------------------
//  When your solution is too slow, look for:
//     B ottlenecks       — the slowest step that limits everything
//     U nnecessary work  — computing things you don't need
//     D uplicated work   — computing the same thing again and again
//  The #1 fix: trade SPACE for TIME with a Set or Dictionary (like hasDupFast).
