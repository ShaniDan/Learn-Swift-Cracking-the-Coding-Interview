// Solutions for Lesson 18 (CtCI Chapter 5). Compare with the book on PDF page 288.
import Support

func countOnes(_ n: Int) -> Int {
    var n = n, count = 0
    while n != 0 {
        count += n & 1
        n >>= 1
    }
    return count
}

func isPowerOfTwo(_ n: Int) -> Bool {
    return n > 0 && (n & (n - 1)) == 0
}

func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    for x in nums { result ^= x }
    return result
}

func insertion(_ n: Int, _ m: Int, _ i: Int, _ j: Int) -> Int {
    let onesIToJ = ((1 << (j - i + 1)) - 1) << i     // 1s at bits i...j
    return (n & ~onesIToJ) | (m << i)
}

func flipBitToWin(_ n: Int) -> Int {
    var n = n
    var current = 0      // length of the run of 1s ending here
    var previous = 0     // length of the run just before the last 0
    var best = 1
    while n != 0 {
        if n & 1 == 1 {
            current += 1
        } else {
            previous = (n & 2) != 0 ? current : 0
            current = 0
        }
        best = max(best, previous + current + 1)
        n >>= 1
    }
    return best
}

func bitsToConvert(_ a: Int, _ b: Int) -> Int {
    return countOnes(a ^ b)
}

func pairwiseSwap(_ n: Int) -> Int {
    return ((n & 0xAAAA_AAAA) >> 1) | ((n & 0x5555_5555) << 1)
}

func nextBiggerSameOnes(_ n: Int) -> Int {
    let target = countOnes(n)
    var candidate = n + 1
    while countOnes(candidate) != target {
        candidate += 1
    }
    return candidate
}
