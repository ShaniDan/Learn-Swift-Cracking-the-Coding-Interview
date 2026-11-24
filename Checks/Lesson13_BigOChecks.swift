import Testing
import Support
@testable import Lesson13_BigO

/// Normalizes answers so "O(N^2)", "O(n²)" and "O(n*n)" all count.
private func norm(_ s: String) -> String {
    var t = s.lowercased().replacingOccurrences(of: " ", with: "")
    for (from, to) in [("²", "^2"), ("ⁿ", "^n"), ("**", "^"), ("n*n", "n^2"), ("log(n)", "logn"),
                       ("n*logn", "nlogn"), ("ab)", "a*b)"), ("b*a", "a*b"), ("b+a", "a+b")] {
        t = t.replacingOccurrences(of: from, with: to)
    }
    return t
}

private func check(_ answer: String, _ expected: String, _ explain: String) {
    #expect(norm(answer) == norm(expected), "You said \(answer). \(explain)")
}

@Suite("Lesson 13 · Big O")
struct Lesson13Checks {
    @Test("A1", .disabled(if: Todo.notStarted { _ = answer1() }, "⏭ not started"))
    func check_a1() { check(answer1(), "O(n)", "Two loops one AFTER the other = O(2n) → drop the constant.") }

    @Test("A2", .disabled(if: Todo.notStarted { _ = answer2() }, "⏭ not started"))
    func check_a2() { check(answer2(), "O(n^2)", "A loop INSIDE a loop over the same input multiplies: n × n.") }

    @Test("A3", .disabled(if: Todo.notStarted { _ = answer3() }, "⏭ not started"))
    func check_a3() { check(answer3(), "O(a*b)", "Two different inputs, nested → multiply, using both letters.") }

    @Test("A4", .disabled(if: Todo.notStarted { _ = answer4() }, "⏭ not started"))
    func check_a4() { check(answer4(), "O(log n)", "n is halved each step — how many halvings to reach 1?") }

    @Test("A5", .disabled(if: Todo.notStarted { _ = answer5() }, "⏭ not started"))
    func check_a5() { check(answer5(), "O(n log n)", "sorted() dominates — sorting is O(n log n).") }

    @Test("A6", .disabled(if: Todo.notStarted { _ = answer6() }, "⏭ not started"))
    func check_a6() { check(answer6(), "O(2^n)", "Each call makes 2 more calls, n levels deep: branches^depth.") }

    @Test("A7", .disabled(if: Todo.notStarted { _ = answer7() }, "⏭ not started"))
    func check_a7() { check(answer7(), "O(n^2)", "array.contains is a hidden O(n) loop, done n times.") }

    @Test("A8", .disabled(if: Todo.notStarted { _ = answer8() }, "⏭ not started"))
    func check_a8() { check(answer8(), "O(k)", "Each dictionary lookup is O(1), done once per key.") }

    @Test("B1. hasDuplicate", .disabled(if: Todo.notStarted { _ = hasDuplicate([]) }, "⏭ not started"))
    func check_hasDuplicate() {
        #expect(hasDuplicate([1, 2, 3, 2]) == true)
        #expect(hasDuplicate([1, 2, 3]) == false)
        #expect(hasDuplicate([]) == false)
        var answer = true
        let big = Array(0..<300_000)
        let fast = finishes(within: 5) { answer = hasDuplicate(big) }
        #expect(fast, "hasDuplicate on 300,000 numbers is too slow")
        if fast { #expect(answer == false) }
    }

    @Test("B2. countCommon", .disabled(if: Todo.notStarted { _ = countCommon([], []) }, "⏭ not started"))
    func check_countCommon() {
        #expect(countCommon([1, 2, 2, 3], [2, 3, 3, 4]) == 2)
        #expect(countCommon([], [1]) == 0)
        var answer = 0
        let a = Array(0..<200_000), b = Array(100_000..<300_000)
        let fast = finishes(within: 5) { answer = countCommon(a, b) }
        #expect(fast, "countCommon on 200,000 numbers is too slow")
        if fast { #expect(answer == 100_000) }
    }

    @Test("B3. pairSumSorted", .disabled(if: Todo.notStarted { _ = pairSumSorted([], 0) }, "⏭ not started"))
    func check_pairSumSorted() {
        #expect(pairSumSorted([1, 2, 4, 7, 11], 15) == true)
        #expect(pairSumSorted([1, 2, 4, 7, 11], 10) == false)
        #expect(pairSumSorted([5], 10) == false)
        #expect(pairSumSorted([5, 5], 10) == true)
        var answer = true
        let big = Array(stride(from: 0, to: 1_000_000, by: 2))
        let fast = finishes(within: 5) { answer = pairSumSorted(big, 3) }
        #expect(fast, "pairSumSorted on 500,000 numbers is too slow")
        if fast { #expect(answer == false) }
    }

    @Test("B4. wordFrequencies", .disabled(if: Todo.notStarted { _ = wordFrequencies([], queries: []) }, "⏭ not started"))
    func check_wordFrequencies() {
        #expect(wordFrequencies(["a", "b", "a"], queries: ["a", "b", "c"]) == [2, 1, 0])
        let words = (0..<200_000).map { "w\($0 % 50_000)" }
        let queries = (0..<50_000).map { "w\($0)" }
        var answer: [Int] = []
        let fast = finishes(within: 5) { answer = wordFrequencies(words, queries: queries) }
        #expect(fast, "wordFrequencies on 200,000 words is too slow — count once with a dictionary")
        if fast { #expect(answer.count == 50_000 && answer.allSatisfy { $0 == 4 }) }
    }
}
