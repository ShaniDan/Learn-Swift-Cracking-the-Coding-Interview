// =============================================================================
//  LESSON 06 — EXERCISES
//  Use loops — not shortcuts like reduce() or reversed() (practice the basics!).
// =============================================================================

import Support

/// 1 + 2 + ... + n.   sumTo(4) → 10.   sumTo(0) → 0
func sumTo(_ n: Int) -> Int {
    todo()
    return -1
}

/// n! = 1 × 2 × ... × n.   factorial(5) → 120.   factorial(0) → 1
func factorial(_ n: Int) -> Int {
    todo()
    return -1
}

/// Count the vowels (a e i o u, any case).   countVowels("Hello World") → 3
func countVowels(_ s: String) -> Int {
    todo()
    return -1
}

/// Reverse s with a loop.   reverseString("abc") → "cba"
func reverseString(_ s: String) -> String {
    todo()
    return "?"
}

/// How many digits does a positive number have? Use a while loop.
/// countDigits(9) → 1    countDigits(12345) → 5
func countDigits(_ n: Int) -> Int {
    todo()
    return -1
}

/// sumOfDigits(1234) → 10.  Use % 10 and / 10 in a while loop.
func sumOfDigits(_ n: Int) -> Int {
    todo()
    return -1
}

/// Reverse the digits of a positive number.  reverseDigits(1234) → 4321
/// Hint: result = result * 10 + (last digit of n), then drop the last digit.
func reverseDigits(_ n: Int) -> Int {
    todo()
    return -1
}

/// true if n is prime (divisible only by 1 and itself). 1 is not prime.
/// Try dividing by every number from 2 up to n-1; return false as soon as one divides evenly.
func isPrime(_ n: Int) -> Bool {
    todo()
    return false
}

/// true if s reads the same backwards. Use  let chars = Array(s)  and
/// compare chars[i] with chars[chars.count - 1 - i].
/// isPalindrome("racecar") → true     isPalindrome("abca") → false
func isPalindrome(_ s: String) -> Bool {
    todo()
    return false
}
