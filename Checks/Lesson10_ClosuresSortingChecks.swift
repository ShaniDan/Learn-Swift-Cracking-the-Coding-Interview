import Testing
import Support
@testable import Lesson10_ClosuresSorting

@Suite("Lesson 10 · Closures & Sorting")
struct Lesson10Checks {
    @Test("1. swapPair", .disabled(if: Todo.notStarted { _ = swapPair((1, 2)) }, "⏭ not started"))
    func check_swapPair() {
        let swapped = swapPair((1, 2))
        #expect(swapped.0 == 2 && swapped.1 == 1, "swapPair((1, 2)) gave \(swapped)")
    }

    @Test("2. squaresOfOdds", .disabled(if: Todo.notStarted { _ = squaresOfOdds([]) }, "⏭ not started"))
    func check_squaresOfOdds() {
        #expect(squaresOfOdds([1, 2, 3, 4, 5]) == [1, 9, 25])
        #expect(squaresOfOdds([]) == [])
    }

    @Test("3. total", .disabled(if: Todo.notStarted { _ = total([]) }, "⏭ not started"))
    func check_total() {
        #expect(total([1, 2, 3, 4]) == 10)
        #expect(total([]) == 0)
    }

    @Test("4. sortByLength", .disabled(if: Todo.notStarted { _ = sortByLength([]) }, "⏭ not started"))
    func check_sortByLength() {
        #expect(sortByLength(["ccc", "b", "a", "dd"]) == ["a", "b", "dd", "ccc"])
        #expect(sortByLength(["yy", "xx", "z"]) == ["z", "xx", "yy"])
    }

    @Test("5. rankStudents", .disabled(if: Todo.notStarted { _ = rankStudents([]) }, "⏭ not started"))
    func check_rankStudents() {
        #expect(rankStudents([("Bo", 90), ("Ann", 90), ("Cy", 95)]) == ["Cy", "Ann", "Bo"])
    }

    @Test("6. areAnagrams", .disabled(if: Todo.notStarted { _ = areAnagrams("", "") }, "⏭ not started"))
    func check_areAnagrams() {
        #expect(areAnagrams("Listen", "Silent") == true)
        #expect(areAnagrams("abc", "abd") == false)
        #expect(areAnagrams("aab", "ab") == false)
    }

    @Test("7. pairUp", .disabled(if: Todo.notStarted { _ = pairUp([], []) }, "⏭ not started"))
    func check_pairUp() {
        #expect(pairUp(["a", "b"], [1, 2]) == ["a": 1, "b": 2])
    }

    @Test("8. manhattanDistance", .disabled(if: Todo.notStarted { _ = manhattanDistance((0, 0), (0, 0)) }, "⏭ not started"))
    func check_manhattanDistance() {
        #expect(manhattanDistance((0, 0), (3, 4)) == 7)
        #expect(manhattanDistance((5, -1), (2, 3)) == 7)
    }

    @Test("9. neighbors", .disabled(if: Todo.notStarted { _ = neighbors(of: (0, 0), rows: 1, cols: 1) }, "⏭ not started"))
    func check_neighbors() {
        #expect(neighbors(of: (0, 0), rows: 3, cols: 3) == [[1, 0], [0, 1]])
        #expect(neighbors(of: (1, 1), rows: 3, cols: 3) == [[0, 1], [2, 1], [1, 0], [1, 2]])
        #expect(neighbors(of: (2, 2), rows: 3, cols: 3) == [[1, 2], [2, 1]])
    }

    @Test("10. numbersIn", .disabled(if: Todo.notStarted { _ = numbersIn([]) }, "⏭ not started"))
    func check_numbersIn() {
        #expect(numbersIn(["10", "x", "3", "7y"]) == [3, 10])
        #expect(numbersIn([]) == [])
    }
}
