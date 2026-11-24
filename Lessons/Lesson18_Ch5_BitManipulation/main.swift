// =============================================================================
//  LESSON 18 — CtCI Chapter 5: Bit Manipulation
// =============================================================================
//  📖 READ FIRST:   Chapter 5 intro + questions     PDF page 124
//  ✅ SOLUTIONS:    PDF page 288
//
//  Computers store numbers in binary (base 2). 13 = 8 + 4 + 1 = 1101.
//      bit index:   3 2 1 0
//      13       =   1 1 0 1
//
//  Swift's Int is 64 bits on your Mac (the book's Java int is 32 bits). The
//  operators work the same way. In this lesson we stick to NON-NEGATIVE numbers.
// =============================================================================


// --- 1. Seeing binary ---------------------------------------------------------------------------

print(String(13, radix: 2))              // 1101
print(Int("1101", radix: 2)!)            // 13
print(0b1101)                            // 13  — a binary literal

func bits(_ n: Int, width: Int = 8) -> String {     // pad to a fixed width
    let s = String(n, radix: 2)
    return String(repeating: "0", count: max(0, width - s.count)) + s
}
print(bits(13))                          // 00001101


// --- 2. The operators -------------------------------------------------------------------------------
//        a = 1100 (12)    b = 1010 (10)
//   a & b    AND   1000 (8)    1 only where BOTH are 1
//   a | b    OR    1110 (14)   1 where EITHER is 1
//   a ^ b    XOR   0110 (6)    1 where they're DIFFERENT
//   ~a       NOT   flips every bit
//   a << 1   shift left   11000 (24)   = × 2
//   a >> 1   shift right  110 (6)      = ÷ 2

let a = 0b1100, b = 0b1010
print(a & b, a | b, a ^ b, a << 1, a >> 1)          // 8 14 6 24 6


// --- 3. The four core tricks (book PDF page 125) — memorize these ---------------------------------
//  A "mask" is a number with 1s exactly where you want to look or change.
//  1 << i  is a mask with only bit i set:  1 << 3 = 1000

func getBit(_ n: Int, _ i: Int) -> Bool { (n & (1 << i)) != 0 }     // is bit i a 1?
func setBit(_ n: Int, _ i: Int) -> Int { n | (1 << i) }             // force bit i to 1
func clearBit(_ n: Int, _ i: Int) -> Int { n & ~(1 << i) }          // force bit i to 0
func updateBit(_ n: Int, _ i: Int, _ isOne: Bool) -> Int {
    clearBit(n, i) | ((isOne ? 1 : 0) << i)
}

print(getBit(13, 2), setBit(13, 1), clearBit(13, 0), updateBit(13, 1, true))   // true 15 12 15


// --- 4. More facts you'll use ------------------------------------------------------------------------
//   x ^ x == 0, x ^ 0 == x   → XOR-ing a list cancels out pairs
//   n & (n - 1)              → n with its LOWEST 1-bit removed
//   n & 1                    → 1 if n is odd
//   Swift built-ins: n.nonzeroBitCount (counts 1s), n.trailingZeroBitCount, n.leadingZeroBitCount

print(12 & 11)                     // 8   (1100 → 1000)
print(13.nonzeroBitCount)          // 3
print([4, 1, 2, 1, 2].reduce(0, ^))   // 4 — the number without a partner
