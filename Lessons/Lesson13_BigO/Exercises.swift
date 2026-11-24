// =============================================================================
//  LESSON 13 — EXERCISES
// =============================================================================

import Support

// PART A — Return the Big O as text, like "O(n)", "O(n^2)", "O(log n)",
//          "O(n log n)", "O(1)", "O(a + b)", "O(a * b)", "O(2^n)".

/// A1.
///     func f(_ nums: [Int]) {
///         for x in nums { print(x) }
///         for x in nums { print(x) }
///     }
func answer1() -> String {
    todo()
    return ""
}

/// A2.
///     for x in nums {
///         for y in nums { print(x, y) }
///     }
func answer2() -> String {
    todo()
    return ""
}

/// A3.  (a and b are two different arrays)
///     for x in a {
///         for y in b { print(x, y) }
///     }
func answer3() -> String {
    todo()
    return ""
}

/// A4.
///     var n = n
///     while n > 1 { n /= 2 }
func answer4() -> String {
    todo()
    return ""
}

/// A5.
///     return nums.sorted()[0]
func answer5() -> String {
    todo()
    return ""
}

/// A6.
///     func f(_ n: Int) -> Int {
///         if n <= 1 { return 1 }
///         return f(n - 1) + f(n - 1)
///     }
func answer6() -> String {
    todo()
    return ""
}

/// A7.   ← careful: nums is an ARRAY
///     for x in nums {
///         if nums.contains(x * 2) { print(x) }
///     }
func answer7() -> String {
    todo()
    return ""
}

/// A8.   (dict is a Dictionary, keys is an array with k items)
///     return keys.map { dict[$0] }
func answer8() -> String {
    todo()
    return ""
}


// PART B — Write FAST code. The checks use huge inputs with a time limit,
//          so an O(n²) solution will fail.

/// true if any value appears twice. Must be O(n).
func hasDuplicate(_ nums: [Int]) -> Bool {
    todo()
    return false
}

/// How many DISTINCT values appear in both arrays? Must be O(a + b).
func countCommon(_ a: [Int], _ b: [Int]) -> Int {
    todo()
    return -1
}

/// nums is SORTED ascending. true if two different positions add up to target.
/// O(n) time and O(1) extra space with two pointers: start at both ends; if the
/// sum is too small move the left pointer right, too big move the right one left.
func pairSumSorted(_ nums: [Int], _ target: Int) -> Bool {
    todo()
    return false
}

/// How many times does each word appear? Return the count for `word`.
/// The text has 200,000 words — count them all in ONE pass with a dictionary,
/// not by searching the array again for every word.
/// (Returns the counts for a list of queries.)
func wordFrequencies(_ words: [String], queries: [String]) -> [Int] {
    todo()
    return []
}
