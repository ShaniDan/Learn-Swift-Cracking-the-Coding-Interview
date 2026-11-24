import Testing
import Support
@testable import Lesson18_Ch5_BitManipulation

@Suite("Lesson 18 · Ch 5 Bit Manipulation")
struct Lesson18Checks {
    @Test("countOnes", .disabled(if: Todo.notStarted { _ = countOnes(1) }, "⏭ not started"))
    func check_countOnes() {
        for n in [0, 1, 13, 255, 1024, 1775] {
            #expect(countOnes(n) == n.nonzeroBitCount, "countOnes(\(n))")
        }
    }

    @Test("5.5 isPowerOfTwo", .disabled(if: Todo.notStarted { _ = isPowerOfTwo(1) }, "⏭ not started"))
    func check_isPowerOfTwo() {
        for n in [0, 1, 2, 3, 4, 6, 8, 1024, 1023, 1 << 40] {
            #expect(isPowerOfTwo(n) == (n > 0 && n & (n - 1) == 0), "isPowerOfTwo(\(n))")
        }
    }

    @Test("singleNumber", .disabled(if: Todo.notStarted { _ = singleNumber([1]) }, "⏭ not started"))
    func check_singleNumber() {
        #expect(singleNumber([4, 1, 2, 1, 2]) == 4)
        #expect(singleNumber([7]) == 7)
    }

    @Test("5.1 insertion", .disabled(if: Todo.notStarted { _ = insertion(0, 0, 0, 0) }, "⏭ not started"))
    func check_insertion() {
        #expect(insertion(0b10000000000, 0b10011, 2, 6) == 0b10001001100)
        #expect(insertion(0b11111111111, 0b10011, 2, 6) == 0b11111001111)
        #expect(insertion(0, 1, 0, 0) == 1)
    }

    @Test("5.3 flipBitToWin", .disabled(if: Todo.notStarted { _ = flipBitToWin(1) }, "⏭ not started"))
    func check_flipBitToWin() {
        for (n, want) in [(1775, 8), (0, 1), (1, 2), (0b111, 4), (0b1011, 4), (0b10001, 2)] {
            #expect(flipBitToWin(n) == want, "flipBitToWin(\(String(n, radix: 2)) in binary)")
        }
    }

    @Test("5.6 bitsToConvert", .disabled(if: Todo.notStarted { _ = bitsToConvert(0, 0) }, "⏭ not started"))
    func check_bitsToConvert() {
        #expect(bitsToConvert(29, 15) == 2)
        #expect(bitsToConvert(5, 5) == 0)
        #expect(bitsToConvert(0, 255) == 8)
    }

    @Test("5.7 pairwiseSwap", .disabled(if: Todo.notStarted { _ = pairwiseSwap(0) }, "⏭ not started"))
    func check_pairwiseSwap() {
        for (n, want) in [(0b10, 0b01), (0b1001, 0b0110), (0b111000, 0b110100), (0, 0)] {
            #expect(pairwiseSwap(n) == want, "pairwiseSwap(0b\(String(n, radix: 2)))")
        }
    }

    @Test("5.4 nextBiggerSameOnes", .disabled(if: Todo.notStarted { _ = nextBiggerSameOnes(1) }, "⏭ not started"))
    func check_nextBiggerSameOnes() {
        for (n, want) in [(0b1, 0b10), (0b110, 0b1001), (13948, 13967), (0b0111, 0b1011)] {
            #expect(nextBiggerSameOnes(n) == want, "nextBiggerSameOnes(\(n))")
        }
    }
}
