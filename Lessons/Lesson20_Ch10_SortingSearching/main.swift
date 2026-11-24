// =============================================================================
//  LESSON 20 — CtCI Chapter 10: Sorting and Searching
// =============================================================================
//  📖 READ FIRST:   Chapter 10 intro + questions     PDF page 158
//  ✅ SOLUTIONS:    PDF page 408
//
//  In real Swift code you just call sorted(). But interviewers ask you to
//  explain and implement sorts, and many questions are binary search in disguise.
// =============================================================================


// --- 1. The sorts to know (book PDF page 158) ------------------------------------------------
//
//   Bubble / Selection sort   O(n²)        simple and slow — know the idea
//   Merge sort                O(n log n)   split in half, sort each half, merge
//   Quick sort                O(n log n)   on average; pick a pivot, partition around it
//   Radix sort                O(kn)        integers, digit by digit
//   Swift's sorted()          O(n log n)   use it in real life

func selectionSort(_ input: [Int]) -> [Int] {
    var nums = input
    for i in nums.indices {
        var smallest = i
        for j in (i + 1)..<nums.count where nums[j] < nums[smallest] {   // find the smallest of the rest...
            smallest = j
        }
        nums.swapAt(i, smallest)                                          // ...and put it at i
    }
    return nums
}
print(selectionSort([5, 2, 9, 1]))      // [1, 2, 5, 9]


// --- 2. Binary search — O(log n) on SORTED data ------------------------------------------------
//  Look at the middle. Too small? The answer is in the right half. Too big?
//  The left half. Each step throws away half → about 20 steps for a million items.
//
//      lo                mid                 hi
//      [1, 3, 5, 7, 9, 11, 13, 15, 17, 19, 21]
//
//  (Your turn to write it — it's the third exercise.)

let sortedNumbers = [1, 3, 5, 7, 9, 11]
print(sortedNumbers.firstIndex(of: 7) as Any)   // O(n) — fine for small arrays, but not binary search!


// --- 3. Sorting custom things ------------------------------------------------------------------

let words = ["pear", "fig", "banana", "kiwi"]
print(words.sorted { $0.count < $1.count })     // by length
print(words.sorted(by: >))                      // Z → A
