// =============================================================================
//  LESSON 19 — CtCI Chapter 8: Recursion and Dynamic Programming
// =============================================================================
//  📖 READ FIRST:   Chapter 8 intro + questions     PDF page 142
//  ✅ SOLUTIONS:    PDF page 354
//
//  RECURSION = a function that calls itself on a SMALLER version of the
//  problem. Every recursive function needs:
//     1. a BASE CASE — a tiny input you can answer directly (stops the calls)
//     2. a RECURSIVE CASE — uses the answer for a smaller input
// =============================================================================


// --- 1. The classic ---------------------------------------------------------------------------

func factorial(_ n: Int) -> Int {
    if n <= 1 { return 1 }              // base case
    return n * factorial(n - 1)         // recursive case: n! = n × (n-1)!
}
print(factorial(5))                     // 120
//  factorial(5) = 5 × factorial(4) = 5 × 4 × factorial(3) = ... = 5×4×3×2×1
//  Forget the base case → the calls never stop → "stack overflow" crash.


// --- 2. Fibonacci: why naive recursion can be terrible (book PDF page 143) ---------------------

func fibSlow(_ n: Int) -> Int {
    if n < 2 { return n }
    return fibSlow(n - 1) + fibSlow(n - 2)      // 2 calls per level → O(2ⁿ)!
}
print(fibSlow(20))
//  fibSlow(40) takes a long time; fibSlow(90) would take centuries. It
//  recomputes the same values over and over.


// --- 3. DYNAMIC PROGRAMMING = recursion + remembering answers ------------------------------------

// 3a. Top-down with MEMOIZATION — store each answer in a dictionary the first time.
func fibMemo(_ n: Int, _ memo: inout [Int: Int]) -> Int {
    if n < 2 { return n }
    if let saved = memo[n] { return saved }
    let result = fibMemo(n - 1, &memo) + fibMemo(n - 2, &memo)
    memo[n] = result
    return result
}
var memo: [Int: Int] = [:]
print(fibMemo(90, &memo))               // instant!

// 3b. A tidy Swift pattern: a NESTED function that shares a memo dictionary.
func fibNested(_ n: Int) -> Int {
    var memo: [Int: Int] = [:]
    func fib(_ k: Int) -> Int {         // a function inside a function
        if k < 2 { return k }
        if let saved = memo[k] { return saved }
        let result = fib(k - 1) + fib(k - 2)
        memo[k] = result
        return result
    }
    return fib(n)
}
print(fibNested(90))

// 3c. Bottom-up — build answers from the smallest upward, in a loop.
func fibBottomUp(_ n: Int) -> Int {
    if n < 2 { return n }
    var (a, b) = (0, 1)
    for _ in 2...n { (a, b) = (b, a + b) }
    return b
}
print(fibBottomUp(90))


// --- 4. Backtracking: build all possibilities ------------------------------------------------------
//  Make a choice, recurse, undo the choice, try the next one.

func allBinaryStrings(_ n: Int) -> [String] {
    var results: [String] = []
    func build(_ prefix: String) {
        if prefix.count == n {
            results.append(prefix)
            return
        }
        build(prefix + "0")
        build(prefix + "1")
    }
    build("")
    return results
}
print(allBinaryStrings(2))              // ["00", "01", "10", "11"]


// --- 5. How to approach a recursive problem (book PDF page 142) ----------------------------------
//  Ask: "If I already had the answer for n-1 (or a smaller piece), how would I
//  build the answer for n?" Then write the base case. Then add memoization if
//  the same sub-problems repeat.
