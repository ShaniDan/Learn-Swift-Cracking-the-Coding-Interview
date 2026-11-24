import Testing
import Support
@testable import Lesson21_Ch16_17_Mixed

@Suite("Lesson 21 · Ch 16–17 Mixed")
struct Lesson21Checks {
    @Test("16.1 numberSwapper", .disabled(if: Todo.notStarted { _ = numberSwapper(1, 2) }, "⏭ not started"))
    func check_numberSwapper() {
        for (a, b) in [(3, 9), (-4, 7), (5, 5), (0, 12)] {
            let got = numberSwapper(a, b)
            #expect(got.0 == b && got.1 == a, "numberSwapper(\(a), \(b)) gave \(got)")
        }
    }

    @Test("16.5 factorialZeros", .disabled(if: Todo.notStarted { _ = factorialZeros(1) }, "⏭ not started"))
    func check_factorialZeros() {
        for (n, want) in [(0, 0), (4, 0), (5, 1), (10, 2), (25, 6), (100, 24)] {
            #expect(factorialZeros(n) == want, "factorialZeros(\(n))")
        }
        var answer = 0
        let fast = finishes(within: 2) { answer = factorialZeros(1_000_000_000_000_000) }
        #expect(fast, "factorialZeros(10^15) is too slow")
        if fast { #expect(answer == 249_999_999_999_997) }
    }

    @Test("16.6 smallestDifference", .disabled(if: Todo.notStarted { _ = smallestDifference([1], [1]) }, "⏭ not started"))
    func check_smallestDifference() {
        #expect(smallestDifference([1, 3, 15, 11, 2], [23, 127, 235, 19, 8]) == 3)
        #expect(smallestDifference([1, 2], [2, 9]) == 0)
        let a = (0..<100_000).map { $0 * 7 }, b = (0..<100_000).map { $0 * 7 + 3 }
        var answer = -1
        let fast = finishes(within: 5) { answer = smallestDifference(a.shuffled(), b.shuffled()) }
        #expect(fast, "smallestDifference on 100,000 numbers each is too slow")
        if fast { #expect(answer == 3) }
    }

    @Test("16.17 maxSubarraySum", .disabled(if: Todo.notStarted { _ = maxSubarraySum([1]) }, "⏭ not started"))
    func check_maxSubarraySum() {
        let cases = [([2, -8, 3, -2, 4, -10], 5), ([-3, -1, -2], -1), ([5], 5), ([1, 2, 3], 6),
                     ([-2, 1, -3, 4, -1, 2, 1, -5, 4], 6)]
        for (nums, want) in cases { #expect(maxSubarraySum(nums) == want, "maxSubarraySum(\(nums))") }
        let big = Array((0..<500_000).map { _ in [1, -1] }.joined())
        var answer = 0
        let fast = finishes(within: 3) { answer = maxSubarraySum(big) }
        #expect(fast, "maxSubarraySum on 1,000,000 numbers is too slow — O(n)!")
        if fast { #expect(answer == 1) }
    }

    @Test("16.24 pairsWithSum", .disabled(if: Todo.notStarted { _ = pairsWithSum([], 0) }, "⏭ not started"))
    func check_pairsWithSum() {
        #expect(pairsWithSum([1, 5, 7, -1, 5], 6) == [[-1, 7], [1, 5]])
        #expect(pairsWithSum([3, 3, 3], 6) == [[3, 3]])
        #expect(pairsWithSum([3], 6) == [])
        #expect(pairsWithSum([2, 4, 3, 3, 1, 5], 6) == [[1, 5], [2, 4], [3, 3]])
    }

    @Test("16.25 LRUCache", .disabled(if: Todo.notStarted {
        let c = LRUCache(capacity: 1); c.put(1, 1); _ = c.get(1)
    }, "⏭ not started"))
    func check_LRUCache() {
        let c = LRUCache(capacity: 2)
        c.put(1, 1)
        c.put(2, 2)
        #expect(c.get(1) == 1, "put(1,1); put(2,2); get(1)")
        c.put(3, 3)                       // evicts 2 (1 was used more recently)
        #expect(c.get(2) == nil, "after put(3,3), key 2 was least recently used and should be gone")
        #expect(c.get(1) == 1)
        #expect(c.get(3) == 3)
        c.put(1, 10)                      // update — 1 becomes newest
        c.put(4, 4)                       // evicts 3
        #expect(c.get(3) == nil, "after put(1,10); put(4,4), key 3 should be evicted")
        #expect(c.get(1) == 10, "get(1) after updating it to 10")
        #expect(c.get(4) == 4)
    }

    @Test("17.4 missingNumber", .disabled(if: Todo.notStarted { _ = missingNumber([0]) }, "⏭ not started"))
    func check_missingNumber() {
        #expect(missingNumber([3, 0, 1]) == 2)
        #expect(missingNumber([0]) == 1)
        #expect(missingNumber([1]) == 0)
        var nums = Array(0...100_000)
        nums.remove(at: 54_321)
        nums.shuffle()
        var answer = -1
        let fast = finishes(within: 3) { answer = missingNumber(nums) }
        #expect(fast, "missingNumber on 100,000 numbers is too slow")
        if fast { #expect(answer == 54_321) }
    }

    @Test("17.10 majorityElement", .disabled(if: Todo.notStarted { _ = majorityElement([1]) }, "⏭ not started"))
    func check_majorityElement() {
        #expect(majorityElement([1, 2, 5, 9, 5, 9, 5, 5, 5]) == 5)
        #expect(majorityElement([3, 1, 7, 1, 3, 7, 3, 7, 1, 7, 7]) == nil)
        #expect(majorityElement([4]) == 4)
        #expect(majorityElement([1, 2]) == nil)
        #expect(majorityElement([2, 2, 1]) == 2)
    }

    @Test("17.14 smallestK", .disabled(if: Todo.notStarted { _ = smallestK([1], 1) }, "⏭ not started"))
    func check_smallestK() {
        #expect(smallestK([5, 1, 8, 3, 9, 2], 3) == [1, 2, 3])
        #expect(smallestK([4, 4, 1], 2) == [1, 4])
        #expect(smallestK([7], 0) == [])
    }

    @Test("17.16 masseuse", .disabled(if: Todo.notStarted { _ = masseuse([]) }, "⏭ not started"))
    func check_masseuse() {
        let cases = [([30, 15, 60, 75, 45, 15, 15, 45], 180), ([75, 105, 120, 75, 90, 135], 330), ([], 0), ([10], 10), ([10, 20], 20)]
        for (appts, want) in cases { #expect(masseuse(appts) == want, "masseuse(\(appts))") }
        var answer = 0
        let big = Array(repeating: 15, count: 100_000)
        let fast = finishes(within: 3) { answer = masseuse(big) }
        #expect(fast, "masseuse on 100,000 appointments is too slow — use DP")
        if fast { #expect(answer == 15 * 50_000) }
    }

    @Test("17.21 histogramVolume", .disabled(if: Todo.notStarted { _ = histogramVolume([]) }, "⏭ not started"))
    func check_histogramVolume() {
        #expect(histogramVolume([0, 0, 4, 0, 0, 6, 0, 0, 3, 0, 5, 0, 1, 0, 0, 0]) == 26)
        #expect(histogramVolume([0, 1, 0, 2, 1, 0, 1, 3, 2, 1, 2, 1]) == 6)
        #expect(histogramVolume([]) == 0)
        #expect(histogramVolume([3, 2, 1]) == 0)
    }

    @Test("16.10 livingPeople", .disabled(if: Todo.notStarted { _ = livingPeople([[1900, 1901]]) }, "⏭ not started"))
    func check_livingPeople() {
        #expect(livingPeople([[1900, 1950], [1940, 1990], [1945, 1960], [1955, 2000], [1970, 1980]]) == 1945)
        #expect(livingPeople([[1990, 1995], [1910, 1915]]) == 1910)
        #expect(livingPeople([[1950, 1960], [1960, 1970]]) == 1960)
    }
}
