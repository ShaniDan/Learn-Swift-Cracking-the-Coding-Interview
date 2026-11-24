// =============================================================================
//  LESSON 09 — EXERCISES
// =============================================================================

import Support

/// A dictionary of how many times each character appears.
/// charCounts("hello") → ["h": 1, "e": 1, "l": 2, "o": 1]
func charCounts(_ s: String) -> [Character: Int] {
    todo()
    return ["?": -1]
}

/// The character that appears most often (assume there's one clear winner).
/// nil for an empty string.
func mostCommonChar(_ s: String) -> Character? {
    todo()
    return "?"
}

/// CtCI 1.1 "Is Unique": true if no character appears twice. Use a Set.
func isUnique(_ s: String) -> Bool {
    todo()
    return false
}

/// CtCI 1.2 "Check Permutation": true if b is a rearrangement of a
/// (same characters, same counts).  "dog","god" → true   "aab","abb" → false
func isPermutation(_ a: String, _ b: String) -> Bool {
    todo()
    return false
}

/// Map each word to its length.  wordLengths(["hi", "yes"]) → ["hi": 2, "yes": 3]
func wordLengths(_ words: [String]) -> [String: Int] {
    todo()
    return ["?": -1]
}

/// Map length → the words of that length (in their original order).
/// groupByLength(["a", "bb", "c"]) → [1: ["a", "c"], 2: ["bb"]]
func groupByLength(_ words: [String]) -> [Int: [String]] {
    todo()
    return [-1: []]
}

/// The values in BOTH arrays, no repeats, sorted.
/// commonItems([3, 1, 2, 2], [2, 3, 4]) → [2, 3]
func commonItems(_ a: [Int], _ b: [Int]) -> [Int] {
    todo()
    return [-1]
}

/// THE most famous interview question. Return the indexes [i, j] (i < j) of
/// the two numbers that add up to target. Exactly one answer exists.
/// twoSum([2, 7, 11, 15], 9) → [0, 1]
/// Must be fast (O(n)): walk once, keeping a dictionary [number: index] of what
/// you've seen. For each number, check whether  target - number  is already in it.
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    todo()
    return []
}

/// The index of the first character that appears exactly once, or -1.
/// firstUniqueChar("leetcode") → 0     firstUniqueChar("aabb") → -1
func firstUniqueChar(_ s: String) -> Int {
    todo()
    return -2
}
