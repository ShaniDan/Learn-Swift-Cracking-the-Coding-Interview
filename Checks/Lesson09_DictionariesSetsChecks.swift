import Testing
import Support
@testable import Lesson09_DictionariesSets

@Suite("Lesson 09 · Dictionaries & Sets")
struct Lesson09Checks {
    @Test("1. charCounts", .disabled(if: Todo.notStarted { _ = charCounts("") }, "⏭ not started"))
    func check_charCounts() {
        #expect(charCounts("hello") == ["h": 1, "e": 1, "l": 2, "o": 1])
        #expect(charCounts("") == [:])
    }

    @Test("2. mostCommonChar", .disabled(if: Todo.notStarted { _ = mostCommonChar("a") }, "⏭ not started"))
    func check_mostCommonChar() {
        #expect(mostCommonChar("banana") == "a")
        #expect(mostCommonChar("mississippii") == "i")
        #expect(mostCommonChar("") == nil)
    }

    @Test("3. isUnique", .disabled(if: Todo.notStarted { _ = isUnique("") }, "⏭ not started"))
    func check_isUnique() {
        #expect(isUnique("abc") == true)
        #expect(isUnique("abca") == false)
        #expect(isUnique("") == true)
        #expect(isUnique("Aa") == true)
    }

    @Test("4. isPermutation", .disabled(if: Todo.notStarted { _ = isPermutation("", "") }, "⏭ not started"))
    func check_isPermutation() {
        #expect(isPermutation("dog", "god") == true)
        #expect(isPermutation("aab", "abb") == false)
        #expect(isPermutation("abc", "ab") == false)
        #expect(isPermutation("listen", "silent") == true)
        #expect(isPermutation("", "") == true)
    }

    @Test("5. wordLengths", .disabled(if: Todo.notStarted { _ = wordLengths([]) }, "⏭ not started"))
    func check_wordLengths() {
        #expect(wordLengths(["hi", "yes"]) == ["hi": 2, "yes": 3])
    }

    @Test("6. groupByLength", .disabled(if: Todo.notStarted { _ = groupByLength([]) }, "⏭ not started"))
    func check_groupByLength() {
        #expect(groupByLength(["a", "bb", "c"]) == [1: ["a", "c"], 2: ["bb"]])
        #expect(groupByLength([]) == [:])
    }

    @Test("7. commonItems", .disabled(if: Todo.notStarted { _ = commonItems([], []) }, "⏭ not started"))
    func check_commonItems() {
        #expect(commonItems([3, 1, 2, 2], [2, 3, 4, 3]) == [2, 3])
        #expect(commonItems([1], [2]) == [])
    }

    @Test("8. twoSum", .disabled(if: Todo.notStarted { _ = twoSum([1, 2], 3) }, "⏭ not started"))
    func check_twoSum() {
        #expect(twoSum([2, 7, 11, 15], 9) == [0, 1])
        #expect(twoSum([3, 2, 4], 6) == [1, 2])
        #expect(twoSum([3, 3], 6) == [0, 1])
        let big = Array(1...200_000)
        var answer: [Int] = []
        let fast = finishes(within: 5) { answer = twoSum(big, 399_999) }
        #expect(fast, "twoSum on 200,000 numbers is too slow — use a dictionary (O(n))")
        if fast { #expect(answer == [199_998, 199_999]) }
    }

    @Test("9. firstUniqueChar", .disabled(if: Todo.notStarted { _ = firstUniqueChar("") }, "⏭ not started"))
    func check_firstUniqueChar() {
        #expect(firstUniqueChar("leetcode") == 0)
        #expect(firstUniqueChar("loveleetcode") == 2)
        #expect(firstUniqueChar("aabb") == -1)
    }
}
