import Testing
import Support
@testable import Lesson20_Ch10_SortingSearching

private func checkSort(_ name: String, _ sort: @escaping ([Int]) -> [Int]) {
    var rng = SystemRandomNumberGenerator()
    let random = (0..<500).map { _ in Int.random(in: -1000...1000, using: &rng) }
    for nums in [[], [1], [3, 1, 2], [5, 5, 1, 5], [9, -2, 0, 4, 4, 8, -7], random] {
        #expect(sort(nums) == nums.sorted(), "\(name)(\(nums.count < 10 ? "\(nums)" : "500 random numbers"))")
    }
    let big = (0..<50_000).map { _ in Int.random(in: 0...1_000_000) }
    var result: [Int] = []
    let fast = finishes(within: 10) { result = sort(big) }
    #expect(fast, "\(name) on 50,000 numbers is too slow — is it really O(n log n)?")
    if fast { #expect(result == big.sorted()) }
}

@Suite("Lesson 20 · Ch 10 Sorting & Searching")
struct Lesson20Checks {
    @Test("mergeSort", .disabled(if: Todo.notStarted { _ = mergeSort([]) }, "⏭ not started"))
    func check_mergeSort() { checkSort("mergeSort", mergeSort) }

    @Test("quickSort", .disabled(if: Todo.notStarted { _ = quickSort([]) }, "⏭ not started"))
    func check_quickSort() { checkSort("quickSort", quickSort) }

    @Test("binarySearch", .disabled(if: Todo.notStarted { _ = binarySearch([], 0) }, "⏭ not started"))
    func check_binarySearch() {
        let nums = [1, 3, 5, 7, 9, 11]
        for (t, want) in [(7, 3), (1, 0), (11, 5)] { #expect(binarySearch(nums, t) == want, "binarySearch(\(nums), \(t))") }
        for t in [4, 0, 12] { #expect(binarySearch(nums, t) == nil, "binarySearch(\(nums), \(t))") }
        #expect(binarySearch([], 3) == nil)
        let big = Array(stride(from: 0, to: 2_000_000, by: 2))
        var allRight = true
        let fast = finishes(within: 3) {
            for t in stride(from: 0, to: 2000, by: 2) where binarySearch(big, t) != t / 2 { allRight = false }
        }
        #expect(fast, "1,000 searches in a million numbers is too slow — is it really O(log n)?")
        #expect(allRight)
    }

    @Test("10.1 sortedMerge", .disabled(if: Todo.notStarted { var a = [0]; sortedMerge(&a, [1]) }, "⏭ not started"))
    func check_sortedMerge() {
        for (real, b) in [([1, 4, 7], [2, 9]), ([], [1, 2]), ([1, 2], []), ([5, 6], [1, 2]), ([1, 3, 5], [2, 4, 6])] {
            var a = real + Array(repeating: 0, count: b.count)
            sortedMerge(&a, b)
            #expect(a == (real + b).sorted(), "sortedMerge(\(real) + buffer, \(b))")
        }
    }

    @Test("10.2 groupAnagrams", .disabled(if: Todo.notStarted { _ = groupAnagrams([]) }, "⏭ not started"))
    func check_groupAnagrams() {
        let words = ["cat", "dog", "tac", "god", "act", "zzz"]
        let got = groupAnagrams(words)
        #expect(got.sorted() == words.sorted(), "must return the same words, reordered: got \(got)")
        let keys = got.map { String($0.sorted()) }
        var finished = Set<String>()
        for (i, key) in keys.enumerated() {
            if i > 0 && keys[i - 1] != key { finished.insert(keys[i - 1]) }
            #expect(!finished.contains(key), "the anagrams of \"\(got[i])\" aren't all together in \(got)")
        }
    }

    @Test("10.3 searchRotated", .disabled(if: Todo.notStarted { _ = searchRotated([], 0) }, "⏭ not started"))
    func check_searchRotated() {
        let nums = [15, 16, 19, 20, 25, 1, 3, 4, 5, 7, 10, 14]
        for t in nums { #expect(searchRotated(nums, t) == nums.firstIndex(of: t), "searchRotated(…, \(t))") }
        for t in [2, 30, 0] { #expect(searchRotated(nums, t) == nil, "searchRotated(…, \(t))") }
        #expect(searchRotated([1, 2, 3, 4], 3) == 2)
        #expect(searchRotated([4, 1], 1) == 1)
        #expect(searchRotated([], 1) == nil)
    }

    @Test("10.9 sortedMatrixSearch", .disabled(if: Todo.notStarted { _ = sortedMatrixSearch([[1]], 1) }, "⏭ not started"))
    func check_sortedMatrixSearch() {
        let m = [[15, 20, 40, 85], [20, 35, 80, 95], [30, 55, 95, 105], [40, 80, 100, 120]]
        #expect(sortedMatrixSearch(m, 55) == [2, 1])
        #expect(sortedMatrixSearch(m, 120) == [3, 3])
        #expect(sortedMatrixSearch(m, 15) == [0, 0])
        #expect(sortedMatrixSearch(m, 56) == nil)
    }

    @Test("10.11 peaksAndValleys", .disabled(if: Todo.notStarted { var a = [1]; peaksAndValleys(&a) }, "⏭ not started"))
    func check_peaksAndValleys() {
        for original in [[5, 3, 1, 2, 3], [1, 2, 3, 4, 5, 6], [9, 1, 0, 4, 8, 7], [1], []] {
            var nums = original
            peaksAndValleys(&nums)
            #expect(nums.sorted() == original.sorted(), "peaksAndValleys(\(original)) changed the values: \(nums)")
            for i in nums.indices.dropFirst() {
                let ok = i % 2 == 1 ? nums[i - 1] >= nums[i] : nums[i - 1] <= nums[i]
                #expect(ok, "peaksAndValleys(\(original)) gave \(nums) — should alternate >= <= >= <= ...")
            }
        }
    }

    @Test("firstBadVersion", .disabled(if: Todo.notStarted { _ = firstBadVersion(1) { _ in true } }, "⏭ not started"))
    func check_firstBadVersion() {
        for (n, first) in [(10, 4), (1, 1), (1000, 1000), (1_000_000, 123_457), (5, 1)] {
            var calls = 0
            let got = firstBadVersion(n) { v in calls += 1; return v >= first }
            #expect(got == first, "firstBadVersion(\(n)) — the first bad one is \(first)")
            let limit = (Int.bitWidth - n.leadingZeroBitCount) + 2
            #expect(calls <= limit, "called isBad \(calls) times for n = \(n); binary search needs at most \(limit)")
        }
    }
}
