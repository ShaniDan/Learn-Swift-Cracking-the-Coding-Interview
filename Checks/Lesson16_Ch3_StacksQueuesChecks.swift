import Testing
import Support
@testable import Lesson16_Ch3_StacksQueues

@Suite("Lesson 16 · Ch 3 Stacks & Queues")
struct Lesson16Checks {
    @Test("Stack", .disabled(if: Todo.notStarted {
        var s = Stack<Int>(); s.push(1); _ = s.peek(); _ = s.pop(); _ = s.isEmpty; _ = s.count
    }, "⏭ not started"))
    func check_Stack() {
        var s = Stack<String>()
        #expect(s.isEmpty == true, "a new stack is empty")
        s.push("a"); s.push("b"); s.push("c")
        #expect(s.count == 3)
        #expect(s.peek() == "c")
        #expect(s.pop() == "c")
        #expect(s.pop() == "b")
        #expect(s.isEmpty == false)
        #expect(s.pop() == "a")
        #expect(s.pop() == nil, "pop on an empty stack → nil")
        #expect(s.peek() == nil, "peek on an empty stack → nil")
    }

    @Test("balancedBrackets", .disabled(if: Todo.notStarted { _ = balancedBrackets("") }, "⏭ not started"))
    func check_balancedBrackets() {
        let cases = [("([]{})", true), ("([)]", false), ("((", false), ("", true), ("a(b)c", true),
                     ("}", false), ("{[()()]}", true), ("())", false)]
        for (s, want) in cases {
            #expect(balancedBrackets(s) == want, "balancedBrackets(\"\(s)\")")
        }
    }

    @Test("3.2 MinStack", .disabled(if: Todo.notStarted {
        var s = MinStack(); s.push(1); _ = s.min(); _ = s.pop()
    }, "⏭ not started"))
    func check_MinStack() {
        var s = MinStack()
        for x in [5, 6, 3, 7, 3, 1] { s.push(x) }
        #expect(s.min() == 1, "after pushing 5, 6, 3, 7, 3, 1")
        for (popped, minAfter) in [(1, 3), (3, 3), (7, 3), (3, 5), (6, 5)] {
            #expect(s.pop() == popped)
            #expect(s.min() == minAfter, "min() after popping \(popped)")
        }
        _ = s.pop()
        #expect(s.min() == nil, "min() of an empty stack → nil")
        #expect(s.pop() == nil)
    }

    @Test("3.3 SetOfStacks", .disabled(if: Todo.notStarted {
        let s = SetOfStacks(capacity: 2); s.push(1); _ = s.pop(); _ = s.pop(at: 0)
    }, "⏭ not started"))
    func check_SetOfStacks() {
        let s = SetOfStacks(capacity: 3)
        for i in 1...7 { s.push(i) }
        #expect(s.stacks.count == 3, "7 items with capacity 3 → 3 sub-stacks")
        #expect(s.pop() == 7)
        #expect(s.stacks.count == 2, "the last sub-stack became empty and should be removed")
        #expect(s.pop(at: 0) == 3, "pop(at: 0) takes the top of the first sub-stack [1, 2, 3]")
        for want in [6, 5, 4, 2, 1] { #expect(s.pop() == want) }
        #expect(s.pop() == nil)
        #expect(s.stacks.count == 0)
    }

    @Test("3.4 MyQueue", .disabled(if: Todo.notStarted {
        var q = MyQueue(); q.enqueue(1); _ = q.peek(); _ = q.dequeue(); _ = q.isEmpty
    }, "⏭ not started"))
    func check_MyQueue() {
        var q = MyQueue()
        #expect(q.isEmpty == true)
        for x in [1, 2, 3] { q.enqueue(x) }
        #expect(q.peek() == 1)
        #expect(q.dequeue() == 1)
        q.enqueue(4)
        #expect(q.dequeue() == 2)
        #expect(q.dequeue() == 3)
        #expect(q.dequeue() == 4, "4 was added after the first dequeue")
        #expect(q.isEmpty == true)
        #expect(q.dequeue() == nil)
    }

    @Test("3.5 sortStack", .disabled(if: Todo.notStarted { _ = sortStack([]) }, "⏭ not started"))
    func check_sortStack() {
        #expect(sortStack([3, 1, 4, 2]) == [4, 3, 2, 1])
        #expect(sortStack([]) == [])
        #expect(sortStack([5, 5, 1]) == [5, 5, 1])
        #expect(sortStack([1, 2, 3]) == [3, 2, 1])
    }

    @Test("3.6 AnimalShelter", .disabled(if: Todo.notStarted {
        let a = AnimalShelter(); a.enqueue("x", .dog); _ = a.dequeueAny(); _ = a.dequeueDog(); _ = a.dequeueCat()
    }, "⏭ not started"))
    func check_AnimalShelter() {
        let shelter = AnimalShelter()
        #expect(shelter.dequeueAny() == nil, "empty shelter")
        shelter.enqueue("Rex", .dog)
        shelter.enqueue("Tom", .cat)
        shelter.enqueue("Fido", .dog)
        shelter.enqueue("Kitty", .cat)
        #expect(shelter.dequeueCat() == "Tom")
        #expect(shelter.dequeueAny() == "Rex")
        #expect(shelter.dequeueAny() == "Fido")
        #expect(shelter.dequeueDog() == nil, "no dogs left")
        #expect(shelter.dequeueAny() == "Kitty")
    }
}
