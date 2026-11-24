import Testing
import Support
@testable import Lesson19_Ch8_RecursionDP

private func allPermutations(_ chars: [Character]) -> [String] {
    if chars.count <= 1 { return [String(chars)] }
    var out: [String] = []
    for i in chars.indices {
        var rest = chars
        let c = rest.remove(at: i)
        out += allPermutations(rest).map { String(c) + $0 }
    }
    return out
}

@Suite("Lesson 19 · Ch 8 Recursion & DP")
struct Lesson19Checks {
    @Test("warm-up: sumArray", .disabled(if: Todo.notStarted { _ = sumArray([]) }, "⏭ not started"))
    func check_sumArray() {
        #expect(sumArray([]) == 0)
        #expect(sumArray([1, 2, 3, 4]) == 10)
    }

    @Test("fib", .disabled(if: Todo.notStarted { _ = fib(1) }, "⏭ not started"))
    func check_fib() {
        for (n, want) in [(0, 0), (1, 1), (2, 1), (10, 55)] { #expect(fib(n) == want, "fib(\(n))") }
        var answer = 0
        let fast = finishes(within: 3) { answer = fib(90) }
        #expect(fast, "fib(90) is too slow — add memoization")
        if fast { #expect(answer == 2_880_067_194_370_816_120) }
    }

    @Test("8.1 tripleStep", .disabled(if: Todo.notStarted { _ = tripleStep(1) }, "⏭ not started"))
    func check_tripleStep() {
        for (n, want) in [(0, 1), (1, 1), (2, 2), (3, 4), (4, 7), (10, 274)] {
            #expect(tripleStep(n) == want, "tripleStep(\(n))")
        }
        var answer = 0
        let fast = finishes(within: 3) { answer = tripleStep(50) }
        #expect(fast, "tripleStep(50) is too slow — add memoization")
        if fast { #expect(answer == 10_562_230_626_642) }
    }

    @Test("8.2 robotPaths", .disabled(if: Todo.notStarted { _ = robotPaths([[0]]) }, "⏭ not started"))
    func check_robotPaths() {
        #expect(robotPaths([[0, 0], [0, 0]]) == 2)
        #expect(robotPaths([[0, 0, 0], [0, 1, 0], [0, 0, 0]]) == 2)
        #expect(robotPaths([[0, 1], [1, 0]]) == 0)
        #expect(robotPaths([[1]]) == 0)
        var answer = 0
        let big = Array(repeating: Array(repeating: 0, count: 16), count: 16)
        let fast = finishes(within: 3) { answer = robotPaths(big) }
        #expect(fast, "robotPaths on a 16×16 grid is too slow — use DP")
        if fast { #expect(answer == 155_117_520) }
    }

    @Test("8.3 magicIndex", .disabled(if: Todo.notStarted { _ = magicIndex([]) }, "⏭ not started"))
    func check_magicIndex() {
        #expect(magicIndex([-40, -20, -1, 1, 2, 3, 5, 7, 9, 12, 13]) == 7)
        #expect(magicIndex([1, 2, 3]) == nil)
        #expect(magicIndex([0]) == 0)
        #expect(magicIndex([]) == nil)
    }

    @Test("8.4 powerSet", .disabled(if: Todo.notStarted { _ = powerSet([]) }, "⏭ not started"))
    func check_powerSet() {
        let got = powerSet([1, 2, 3]).map { $0.sorted() }.sorted { $0.lexicographicallyPrecedes($1) }
        let want = [[], [1], [1, 2], [1, 2, 3], [1, 3], [2], [2, 3], [3]]
        #expect(got == want, "powerSet([1, 2, 3]) should contain these 8 subsets (any order)")
        #expect(powerSet([]) == [[]])
    }

    @Test("8.5 recursiveMultiply", .disabled(if: Todo.notStarted { _ = recursiveMultiply(1, 1) }, "⏭ not started"))
    func check_recursiveMultiply() {
        for (a, b) in [(3, 4), (1, 1), (7, 13), (12_345, 678)] {
            #expect(recursiveMultiply(a, b) == a * b, "recursiveMultiply(\(a), \(b))")
        }
    }

    @Test("8.6 hanoi", .disabled(if: Todo.notStarted { _ = hanoi(1) }, "⏭ not started"))
    func check_hanoi() {
        for n in [1, 2, 3, 6] {
            let moves = hanoi(n)
            #expect(moves.count == (1 << n) - 1, "hanoi(\(n)) should take \((1 << n) - 1) moves")
            var towers: [String: [Int]] = ["A": Array((1...n).reversed()), "B": [], "C": []]
            for move in moves {
                guard move.count == 2, let disk = towers[move[0]]?.last else {
                    Issue.record("hanoi(\(n)): invalid move \(move) (empty tower?)"); return
                }
                if let top = towers[move[1]]?.last, top < disk {
                    Issue.record("hanoi(\(n)): move \(move) puts disk \(disk) on smaller disk \(top)"); return
                }
                towers[move[0]]!.removeLast()
                towers[move[1]]!.append(disk)
            }
            #expect(towers["C"] == Array((1...n).reversed()), "after hanoi(\(n)) all disks should be on C")
        }
    }

    @Test("8.7 permutations", .disabled(if: Todo.notStarted { _ = permutations("") }, "⏭ not started"))
    func check_permutations() {
        for s in ["abc", "a", "abcd"] {
            #expect(permutations(s).sorted() == allPermutations(Array(s)).sorted(), "permutations(\"\(s)\")")
        }
    }

    @Test("8.8 permutationsWithDups", .disabled(if: Todo.notStarted { _ = permutationsWithDups("") }, "⏭ not started"))
    func check_permutationsWithDups() {
        for s in ["aab", "aaa", "abca"] {
            let want = Array(Set(allPermutations(Array(s)))).sorted()
            #expect(permutationsWithDups(s).sorted() == want, "permutationsWithDups(\"\(s)\") (no duplicates allowed)")
        }
    }

    @Test("8.9 parens", .disabled(if: Todo.notStarted { _ = parens(1) }, "⏭ not started"))
    func check_parens() {
        #expect(parens(3).sorted() == ["((()))", "(()())", "(())()", "()(())", "()()()"])
        #expect(parens(6).count == 132)
    }

    @Test("8.11 coins", .disabled(if: Todo.notStarted { _ = coins(1) }, "⏭ not started"))
    func check_coins() {
        for (n, want) in [(0, 1), (4, 1), (5, 2), (10, 4), (25, 13), (100, 242)] {
            #expect(coins(n) == want, "coins(\(n))")
        }
        var answer = 0
        let fast = finishes(within: 3) { answer = coins(1000) }
        #expect(fast, "coins(1000) is too slow — add memoization")
        if fast { #expect(answer == 142_511) }
    }
}
