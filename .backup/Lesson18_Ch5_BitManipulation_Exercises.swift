// =============================================================================
//  LESSON 18 — EXERCISES: Chapter 5
//  Use the bit operators (&, |, ^, ~, <<, >>). Avoid the built-in shortcuts
//  like nonzeroBitCount here — the point is to practice the operators.
// =============================================================================

import Support

/// How many 1 bits does n have?   countOnes(13) → 3  (1101)
/// Loop: look at n & 1, then shift n right.
func countOnes(_ n: Int) -> Int {
    todo()
    return -1
}

/// 5.5 Debugger — the book asks what  (n & (n - 1)) == 0  means.
/// Answer: n is a power of two (or zero)! Use it: true for 1, 2, 4, 8, ...
/// and false for 0 and everything else.
func isPowerOfTwo(_ n: Int) -> Bool {
    todo()
    return false
}

/// Every number appears twice except one. Find it with XOR.
/// singleNumber([4, 1, 2, 1, 2]) → 4
func singleNumber(_ nums: [Int]) -> Int {
    todo()
    return -1
}

/// 5.1 Insertion — put the bits of m into n so that m starts at bit j and ends
/// at bit i (bits i...j of n are replaced). Assume m fits.
/// n = 10000000000, m = 10011, i = 2, j = 6  →  10001001100
/// Steps: make a mask that clears bits i...j of n, then OR in (m << i).
func insertion(_ n: Int, _ m: Int, _ i: Int, _ j: Int) -> Int {
    todo()
    return -1
}

/// 5.3 Flip Bit to Win — you may flip ONE 0-bit to 1. Return the length of the
/// longest run of 1s you can make.   flipBitToWin(1775) → 8   (11011101111)
/// (Treat n as having plenty of leading zeros, so flipBitToWin(0) → 1.)
func flipBitToWin(_ n: Int) -> Int {
    todo()
    return -1
}

/// 5.6 Conversion — how many bits must you flip to turn a into b?
/// bitsToConvert(29, 15) → 2    (11101 vs 01111)
/// Hint: XOR shows which bits differ; then count the 1s.
func bitsToConvert(_ a: Int, _ b: Int) -> Int {
    todo()
    return -1
}

/// 5.7 Pairwise Swap — swap every even bit with the odd bit next to it
/// (bit 0 ↔ bit 1, bit 2 ↔ bit 3, ...). Assume n fits in 32 bits.
/// pairwiseSwap(0b10) → 0b01      pairwiseSwap(0b1001) → 0b0110
/// Hint: 0xAAAAAAAA has 1s at all odd positions; 0x55555555 at all even ones.
func pairwiseSwap(_ n: Int) -> Int {
    todo()
    return -1
}

/// 5.4 Next Number (part) — the smallest number BIGGER than n with the same
/// number of 1 bits. You may brute-force it (try n+1, n+2, ... using your
/// countOnes). The book shows a clever O(bits) method — read it afterwards!
func nextBiggerSameOnes(_ n: Int) -> Int {
    todo()
    return -1
}
