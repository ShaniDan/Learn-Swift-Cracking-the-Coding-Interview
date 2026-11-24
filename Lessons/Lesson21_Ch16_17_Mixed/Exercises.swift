// =============================================================================
//  LESSON 21 — EXERCISES: Chapters 16 & 17
// =============================================================================

import Support

/// 16.1 Number Swapper — return (b, a), but WITHOUT a temporary variable and
/// without Swift's (a, b) = (b, a) trick. Use only + and - (or ^) on a and b.
func numberSwapper(_ a: Int, _ b: Int) -> (Int, Int) {
    var a = a, b = b
    todo()
    return (a, b)
}

/// 16.5 Factorial Zeros — how many zeros are at the END of n! ?
/// factorialZeros(10) → 2   (10! = 3628800). Don't compute n! (it overflows) —
/// each trailing zero comes from a 5 × 2 pair; count the factors of 5.
func factorialZeros(_ n: Int) -> Int {
    todo()
    return -1
}

/// 16.6 Smallest Difference — pick one number from each array so their
/// difference is as small as possible; return that (non-negative) difference.
/// [1, 3, 15, 11, 2], [23, 127, 235, 19, 8] → 3   (11 and 8)
/// Hint: sort both, then two pointers.
func smallestDifference(_ a: [Int], _ b: [Int]) -> Int {
    todo()
    return -1
}

/// 16.17 Contiguous Sequence — the largest sum of any non-empty run of
/// neighboring numbers.  [2, -8, 3, -2, 4, -10] → 5   (3, -2, 4).   O(n).
func maxSubarraySum(_ nums: [Int]) -> Int {
    todo()
    return -1
}

/// 16.24 Pairs with Sum — all pairs [smaller, bigger] of values from DIFFERENT
/// positions that add up to target, with no repeated pairs, sorted.
/// pairsWithSum([1, 5, 7, -1, 5], 6) → [[-1, 7], [1, 5]]
func pairsWithSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    todo()
    return [[-1]]
}

/// 16.25 LRU Cache — holds at most `capacity` keys. get(key) returns the value
/// (or nil) and marks the key as recently used. put(key, value) adds/updates;
/// if that makes it too big, evict the LEAST recently used key.
/// Book version: Dictionary + doubly linked list (see DNode in main.swift),
/// making both O(1). A simpler version with an array of keys is fine to start.
class LRUCache {
    let capacity: Int

    init(capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int? {
        todo()
        return nil
    }

    func put(_ key: Int, _ value: Int) {
        todo()
    }
}

/// 17.4 Missing Number (simplified) — nums holds every integer from 0 to n
/// except one (nums.count == n). Find it in O(n) time, O(1) extra space.
func missingNumber(_ nums: [Int]) -> Int {
    todo()
    return -1
}

/// 17.10 Majority Element — the value that makes up MORE than half of the
/// array, or nil if there isn't one. Bonus: O(n) time and O(1) space
/// (look up the Boyer–Moore voting idea in the book's solution).
func majorityElement(_ nums: [Int]) -> Int? {
    todo()
    return -1
}

/// 17.14 Smallest K — the k smallest numbers, sorted ascending.
func smallestK(_ nums: [Int], _ k: Int) -> [Int] {
    todo()
    return [-1]
}

/// 17.16 The Masseuse — back-to-back appointment requests (in minutes); you
/// can't accept two NEIGHBORING ones. Return the maximum total minutes.
/// [30, 15, 60, 75, 45, 15, 15, 45] → 180   (30 + 60 + 45 + 45)
/// DP: best(i) = max(take i + best(i+2), skip i → best(i+1)).
func masseuse(_ appointments: [Int]) -> Int {
    todo()
    return -1
}

/// 17.21 Volume of Histogram — bars of these heights, width 1. Pour water from
/// above: how many units does it hold?
/// [0, 0, 4, 0, 0, 6, 0, 0, 3, 0, 5, 0, 1, 0, 0, 0] → 26
/// Water above bar i = min(tallest bar on its left, tallest on its right) − height[i].
func histogramVolume(_ heights: [Int]) -> Int {
    todo()
    return -1
}

/// 16.10 Living People — people is a list of [birthYear, deathYear] (both
/// between 1900 and 2000; someone counts as alive in both years). Return the
/// year with the most people alive (the earliest year if there's a tie).
func livingPeople(_ people: [[Int]]) -> Int {
    todo()
    return -1
}
