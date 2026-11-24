// =============================================================================
//  LESSON 19 — EXERCISES: Chapter 8
//  Some checks use big inputs with a time limit — those NEED memoization.
// =============================================================================

import Support

/// Warm-up: add up an array RECURSIVELY (no loops, no reduce).
/// Base case: empty → 0. Otherwise: first item + sumArray(the rest).
/// (Array(nums.dropFirst()) gives "the rest".)
func sumArray(_ nums: [Int]) -> Int {
    todo()
    return -1
}

/// The nth Fibonacci number (fib(0) = 0, fib(1) = 1). Must handle fib(90) instantly.
func fib(_ n: Int) -> Int {
    todo()
    return -1
}

/// 8.1 Triple Step — a child climbs n stairs taking 1, 2 or 3 steps at a time.
/// How many different ways are there?
/// tripleStep(3) → 4  (1+1+1, 1+2, 2+1, 3).   tripleStep(0) → 1.
/// Must handle n = 50 quickly.
func tripleStep(_ n: Int) -> Int {
    todo()
    return -1
}

/// 8.2 Robot in a Grid (counting version) — a robot starts at the top-left and
/// may only move RIGHT or DOWN. Cells with 1 are blocked, 0 are open. Return the
/// number of different paths to the bottom-right cell (0 if none).
/// robotPaths([[0, 0], [0, 0]]) → 2
func robotPaths(_ grid: [[Int]]) -> Int {
    todo()
    return -1
}

/// 8.3 Magic Index — arr is sorted with DISTINCT integers. A magic index is i
/// where arr[i] == i. Return one, or nil. Beat O(n) with binary-search-style
/// recursion: if arr[mid] < mid, the answer can only be to the right.
func magicIndex(_ arr: [Int]) -> Int? {
    todo()
    return -1
}

/// 8.4 Power Set — all subsets (any order).  powerSet([1, 2]) → [[], [1], [2], [1, 2]]
/// Idea: the subsets of [1, 2, 3] = the subsets of [2, 3], plus each of those with 1 added.
func powerSet(_ items: [Int]) -> [[Int]] {
    todo()
    return [[-1]]
}

/// 8.5 Recursive Multiply — multiply two positive Ints WITHOUT using *.
/// You may use +, -, and bit shifts. Aim for far fewer than b additions:
/// a × b = 2 × (a × (b / 2)), plus one more a if b is odd. Doubling is x + x.
func recursiveMultiply(_ a: Int, _ b: Int) -> Int {
    todo()
    return -1
}

/// 8.6 Towers of Hanoi — move n disks from tower "A" to "C" using "B".
/// Return the list of moves as ["A", "C"] pairs (from, to).
/// hanoi(1) → [["A", "C"]]
/// Idea: move n-1 disks A→B, move the biggest A→C, move the n-1 disks B→C.
func hanoi(_ n: Int) -> [[String]] {
    todo()
    return [["?"]]
}

/// 8.7 Permutations without Dups — every ordering of a string whose characters
/// are all different (any order).  permutations("abc") → 6 strings
func permutations(_ s: String) -> [String] {
    todo()
    return ["?"]
}

/// 8.8 Permutations with Dups — all DISTINCT orderings; s may repeat letters.
/// permutationsWithDups("aab") → ["aab", "aba", "baa"]
/// (Making all then removing duplicates works; the book's better way builds
/// from a dictionary of letter counts.)
func permutationsWithDups(_ s: String) -> [String] {
    todo()
    return ["?"]
}

/// 8.9 Parens — all valid combinations of n pairs of parentheses (any order).
/// parens(3) → ["((()))", "(()())", "(())()", "()(())", "()()()"]
/// Backtracking: add "(" if you have some left; add ")" only if there are
/// more "(" than ")" so far.
func parens(_ n: Int) -> [String] {
    todo()
    return ["?"]
}

/// 8.11 Coins — the number of ways to make n cents from quarters (25), dimes
/// (10), nickels (5) and pennies (1). Order doesn't matter.
/// coins(10) → 4  (10, 5+5, 5+1+1+1+1+1, ten 1s).  Must handle n = 1000 quickly.
func coins(_ n: Int) -> Int {
    todo()
    return -1
}
