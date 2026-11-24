import Testing
import Support
@testable import Lesson08_Arrays

@Suite("Lesson 08 · Arrays")
struct Lesson08Checks {
    @Test("1. findMax", .disabled(if: Todo.notStarted { _ = findMax([1]) }, "⏭ not started"))
    func check_findMax() {
        #expect(findMax([3, 9, 2]) == 9)
        #expect(findMax([-5, -2, -9]) == -2)
        #expect(findMax([7]) == 7)
    }

    @Test("2. countEvens", .disabled(if: Todo.notStarted { _ = countEvens([]) }, "⏭ not started"))
    func check_countEvens() {
        #expect(countEvens([1, 2, 3, 4, 6]) == 3)
        #expect(countEvens([]) == 0)
    }

    @Test("3. reversedCopy", .disabled(if: Todo.notStarted { _ = reversedCopy([]) }, "⏭ not started"))
    func check_reversedCopy() {
        #expect(reversedCopy([1, 2, 3]) == [3, 2, 1])
        #expect(reversedCopy([]) == [])
    }

    @Test("4. reverseInPlace", .disabled(if: Todo.notStarted { var x = [1]; reverseInPlace(&x) }, "⏭ not started"))
    func check_reverseInPlace() {
        for original in [[1, 2, 3, 4], [1, 2, 3], [], [7]] {
            var nums = original
            reverseInPlace(&nums)
            #expect(nums == Array(original.reversed()), "reverseInPlace(\(original))")
        }
    }

    @Test("5. removeDuplicates", .disabled(if: Todo.notStarted { _ = removeDuplicates([]) }, "⏭ not started"))
    func check_removeDuplicates() {
        #expect(removeDuplicates([3, 1, 3, 2, 1]) == [3, 1, 2])
        #expect(removeDuplicates([]) == [])
    }

    @Test("6. secondLargest", .disabled(if: Todo.notStarted { _ = secondLargest([]) }, "⏭ not started"))
    func check_secondLargest() {
        #expect(secondLargest([4, 1, 4, 3]) == 3)
        #expect(secondLargest([5, 5]) == nil)
        #expect(secondLargest([1, 2]) == 1)
        #expect(secondLargest([10]) == nil)
    }

    @Test("7. makeGrid", .disabled(if: Todo.notStarted { _ = makeGrid(rows: 1, cols: 1, value: 0) }, "⏭ not started"))
    func check_makeGrid() {
        #expect(makeGrid(rows: 2, cols: 3, value: 0) == [[0, 0, 0], [0, 0, 0]])
        #expect(makeGrid(rows: 1, cols: 2, value: 7) == [[7, 7]])
    }

    @Test("8. column", .disabled(if: Todo.notStarted { _ = column([[1]], 0) }, "⏭ not started"))
    func check_column() {
        #expect(column([[1, 2], [3, 4], [5, 6]], 1) == [2, 4, 6])
        #expect(column([[1, 2], [3, 4], [5, 6]], 0) == [1, 3, 5])
    }

    @Test("9. mergeSorted", .disabled(if: Todo.notStarted { _ = mergeSorted([], []) }, "⏭ not started"))
    func check_mergeSorted() {
        #expect(mergeSorted([1, 4, 9], [2, 3, 10]) == [1, 2, 3, 4, 9, 10])
        #expect(mergeSorted([], [1, 2]) == [1, 2])
        #expect(mergeSorted([5, 6], []) == [5, 6])
        #expect(mergeSorted([1, 1, 2], [1, 3]) == [1, 1, 1, 2, 3])
    }

    @Test("10. moveZeros", .disabled(if: Todo.notStarted { var x = [0]; moveZeros(&x) }, "⏭ not started"))
    func check_moveZeros() {
        for (input, want) in [([0, 1, 0, 3, 12], [1, 3, 12, 0, 0]), ([0, 0], [0, 0]), ([1, 2], [1, 2]), ([], [])] {
            var nums = input
            moveZeros(&nums)
            #expect(nums == want, "moveZeros(\(input))")
        }
    }
}
