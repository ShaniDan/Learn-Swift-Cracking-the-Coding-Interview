// =============================================================================
//  LESSON 16 — EXERCISES: Chapter 3
// =============================================================================

import Support

/// Build your own generic stack on top of an array.
/// pop() and peek() return nil when the stack is empty.
struct Stack<Element> {
    private var items: [Element] = []

    mutating func push(_ item: Element) {
        todo()
    }

    mutating func pop() -> Element? {
        todo()
        return nil
    }

    func peek() -> Element? {
        todo()
        return nil
    }

    var isEmpty: Bool {
        todo()
        return false
    }

    var count: Int {
        todo()
        return -1
    }
}

/// Classic stack problem (asked everywhere): true if every ( [ { has a
/// matching closer in the right order. Ignore other characters.
/// "([]{})" → true     "([)]" → false     "((" → false
func balancedBrackets(_ s: String) -> Bool {
    todo()
    return false
}

/// 3.2 Stack Min — a stack whose min() returns the smallest item, with push,
/// pop and min ALL O(1). Hint: also remember what the min was when each item
/// was pushed. pop() and min() return nil when empty.
struct MinStack {
    mutating func push(_ value: Int) {
        todo()
    }

    mutating func pop() -> Int? {
        todo()
        return nil
    }

    func min() -> Int? {
        todo()
        return nil
    }
}

/// 3.3 Stack of Plates — acts like ONE stack, but uses a list of smaller
/// stacks inside, each holding at most `capacity` items. When one is full,
/// start a new one; when one becomes empty, remove it.
/// Follow-up: pop(at:) pops from a specific sub-stack.
class SetOfStacks {
    let capacity: Int
    var stacks: [[Int]] = []         // the checks look at stacks.count

    init(capacity: Int) {
        self.capacity = capacity
    }

    func push(_ value: Int) {
        todo()
    }

    func pop() -> Int? {
        todo()
        return nil
    }

    func pop(at index: Int) -> Int? {
        todo()
        return nil
    }
}

/// 3.4 Queue via Stacks — a FIFO queue using only two arrays used as stacks
/// (only append, popLast and last). Hint: one stack for new items, one for
/// items ready to leave; move everything across only when "outbox" is empty.
struct MyQueue {
    private var inbox: [Int] = []
    private var outbox: [Int] = []

    mutating func enqueue(_ value: Int) {
        todo()
    }

    mutating func dequeue() -> Int? {
        todo()
        return nil
    }

    mutating func peek() -> Int? {
        todo()
        return nil
    }

    var isEmpty: Bool {
        todo()
        return false
    }
}

/// 3.5 Sort Stack — the array is a stack whose END is the top. Return a new
/// stack sorted so the SMALLEST item is on top (at the end). Use only ONE
/// extra stack as temporary storage — no sort()/sorted()!
/// sortStack([3, 1, 4, 2]) → [4, 3, 2, 1]   (1 is on top)
func sortStack(_ stack: [Int]) -> [Int] {
    todo()
    return [-1]
}

/// 3.6 Animal Shelter — first in, first out, for dogs and cats.
/// dequeueAny() gives the name of the animal that's been there longest;
/// dequeueDog() / dequeueCat() the oldest of that kind; nil if none.
/// Hint: two arrays of (order, name) + an arrival counter.
enum Species {
    case dog, cat
}

class AnimalShelter {
    func enqueue(_ name: String, _ species: Species) {
        todo()
    }

    func dequeueAny() -> String? {
        todo()
        return nil
    }

    func dequeueDog() -> String? {
        todo()
        return nil
    }

    func dequeueCat() -> String? {
        todo()
        return nil
    }
}
