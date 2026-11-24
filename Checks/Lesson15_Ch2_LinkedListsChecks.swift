import Testing
import Support
@testable import Lesson15_Ch2_LinkedLists

private func show(_ values: [Int]) -> String {
    values.isEmpty ? "(empty)" : values.map(String.init).joined(separator: " → ")
}

@Suite("Lesson 15 · Ch 2 Linked Lists")
struct Lesson15Checks {
    @Test("warm-up: length", .disabled(if: Todo.notStarted { _ = length(nil) }, "⏭ not started"))
    func check_length() {
        for values in [[], [1], [1, 2, 3, 4]] {
            #expect(length(makeList(values)) == values.count, "length(\(show(values)))")
        }
    }

    @Test("warm-up: reverse", .disabled(if: Todo.notStarted { _ = reverse(nil) }, "⏭ not started"))
    func check_reverse() {
        for values in [[1, 2, 3], [1], []] {
            #expect(toArray(reverse(makeList(values))) == Array(values.reversed()), "reverse(\(show(values)))")
        }
    }

    @Test("2.1 removeDups", .disabled(if: Todo.notStarted { removeDups(nil) }, "⏭ not started"))
    func check_removeDups() {
        for (values, want) in [([1, 2, 1, 3, 2], [1, 2, 3]), ([1, 1, 1], [1]), ([5], [5]), ([1, 2, 3], [1, 2, 3])] {
            let head = makeList(values)
            removeDups(head)
            #expect(toArray(head) == want, "removeDups(\(show(values)))")
        }
    }

    @Test("2.2 kthToLast", .disabled(if: Todo.notStarted { _ = kthToLast(makeList([1]), 1) }, "⏭ not started"))
    func check_kthToLast() {
        let values = [1, 2, 3, 4]
        for (k, want) in [(1, 4), (2, 3), (4, 1)] {
            #expect(kthToLast(makeList(values), k) == want, "kthToLast(\(show(values)), \(k))")
        }
    }

    @Test("2.3 deleteMiddleNode", .disabled(if: Todo.notStarted { deleteMiddleNode(makeList([1, 2])!) }, "⏭ not started"))
    func check_deleteMiddleNode() {
        let head = makeList([10, 20, 30, 40, 50])!
        deleteMiddleNode(head.next!.next!)          // the node holding 30
        #expect(toArray(head) == [10, 20, 40, 50], "after deleting the node with 30")
    }

    @Test("2.4 partition", .disabled(if: Todo.notStarted { _ = partition(nil, 0) }, "⏭ not started"))
    func check_partition() {
        for (values, x) in [([3, 5, 8, 5, 10, 2, 1], 5), ([1, 2, 3], 0), ([3, 2, 1], 2), ([], 1)] {
            let got = toArray(partition(makeList(values), x))
            #expect(got.sorted() == values.sorted(), "partition(\(show(values)), \(x)) lost or added nodes: \(show(got))")
            let firstBig = got.firstIndex { $0 >= x } ?? got.count
            #expect(got[firstBig...].allSatisfy { $0 >= x }, "partition(\(show(values)), \(x)) gave \(show(got))")
        }
    }

    @Test("2.5 sumLists", .disabled(if: Todo.notStarted { _ = sumLists(nil, nil) }, "⏭ not started"))
    func check_sumLists() {
        for (a, b, want) in [([7, 1, 6], [5, 9, 2], [2, 1, 9]), ([9, 9], [1], [0, 0, 1]), ([0], [0], [0]), ([5], [5], [0, 1])] {
            #expect(toArray(sumLists(makeList(a), makeList(b))) == want, "sumLists(\(show(a)), \(show(b)))")
        }
    }

    @Test("2.6 isPalindrome", .disabled(if: Todo.notStarted { _ = isPalindrome(nil) }, "⏭ not started"))
    func check_isPalindrome() {
        for (values, want) in [([1, 2, 1], true), ([1, 2, 2, 1], true), ([1, 2], false), ([7], true), ([], true), ([1, 2, 3, 1], false)] {
            #expect(isPalindrome(makeList(values)) == want, "isPalindrome(\(show(values)))")
        }
    }

    @Test("2.7 intersection", .disabled(if: Todo.notStarted { _ = intersection(nil, nil) }, "⏭ not started"))
    func check_intersection() {
        let shared = makeList([7, 2, 1])!
        let a = ListNode(3, next: ListNode(1, next: ListNode(5, next: shared)))
        let b = ListNode(4, next: ListNode(6, next: shared))
        #expect(intersection(a, b) === shared, "should return the shared node holding 7 (the same object)")
        #expect(intersection(makeList([1, 2, 3]), makeList([1, 2, 3])) == nil,
                "equal VALUES but different nodes don't intersect")
    }

    @Test("2.8 loopStart", .disabled(if: Todo.notStarted { _ = loopStart(nil) }, "⏭ not started"))
    func check_loopStart() {
        let head = makeList([1, 2, 3, 4, 5])!
        let three = head.next!.next!
        three.next!.next!.next = three              // 5 → back to 3
        var result: ListNode? = nil
        let done = finishes(within: 3) { result = loopStart(head) }
        #expect(done, "loopStart never finished — walking until nil loops forever on a looped list!")
        if done { #expect(result === three, "the loop starts at the node holding 3") }
        #expect(loopStart(makeList([1, 2, 3])) == nil, "a list without a loop → nil")
        three.next = nil                            // break the cycle so memory can be freed
    }
}
