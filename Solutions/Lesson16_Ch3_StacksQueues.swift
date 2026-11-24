// Solutions for Lesson 16 (CtCI Chapter 3). Compare with the book on PDF page 239.
import Support

struct Stack<Element> {
    private var items: [Element] = []

    mutating func push(_ item: Element) {
        items.append(item)
    }

    mutating func pop() -> Element? {
        return items.popLast()
    }

    func peek() -> Element? {
        return items.last
    }

    var isEmpty: Bool {
        return items.isEmpty
    }

    var count: Int {
        return items.count
    }
}

func balancedBrackets(_ s: String) -> Bool {
    let pairs: [Character: Character] = [")": "(", "]": "[", "}": "{"]
    var stack: [Character] = []
    for ch in s {
        if "([{".contains(ch) {
            stack.append(ch)
        } else if let opener = pairs[ch] {
            if stack.popLast() != opener { return false }
        }
    }
    return stack.isEmpty
}

struct MinStack {
    private var items: [(value: Int, minSoFar: Int)] = []

    mutating func push(_ value: Int) {
        let currentMin = Swift.min(value, items.last?.minSoFar ?? value)
        items.append((value, currentMin))
    }

    mutating func pop() -> Int? {
        return items.popLast()?.value
    }

    func min() -> Int? {
        return items.last?.minSoFar
    }
}

class SetOfStacks {
    let capacity: Int
    var stacks: [[Int]] = []

    init(capacity: Int) {
        self.capacity = capacity
    }

    func push(_ value: Int) {
        if stacks.isEmpty || stacks[stacks.count - 1].count == capacity {
            stacks.append([])
        }
        stacks[stacks.count - 1].append(value)
    }

    func pop() -> Int? {
        return pop(at: stacks.count - 1)
    }

    func pop(at index: Int) -> Int? {
        guard stacks.indices.contains(index) else { return nil }
        let value = stacks[index].removeLast()
        if stacks[index].isEmpty {
            stacks.remove(at: index)
        }
        return value
    }
}

struct MyQueue {
    private var inbox: [Int] = []
    private var outbox: [Int] = []

    private mutating func shift() {
        if outbox.isEmpty {
            while let x = inbox.popLast() {
                outbox.append(x)
            }
        }
    }

    mutating func enqueue(_ value: Int) {
        inbox.append(value)
    }

    mutating func dequeue() -> Int? {
        shift()
        return outbox.popLast()
    }

    mutating func peek() -> Int? {
        shift()
        return outbox.last
    }

    var isEmpty: Bool {
        return inbox.isEmpty && outbox.isEmpty
    }
}

func sortStack(_ stack: [Int]) -> [Int] {
    var input = stack
    var result: [Int] = []          // the one extra stack: biggest at the bottom
    while let tmp = input.popLast() {
        while let top = result.last, top < tmp {
            input.append(result.removeLast())
        }
        result.append(tmp)
    }
    return result
}

enum Species {
    case dog, cat
}

class AnimalShelter {
    private var dogs: [(order: Int, name: String)] = []
    private var cats: [(order: Int, name: String)] = []
    private var counter = 0

    func enqueue(_ name: String, _ species: Species) {
        counter += 1
        switch species {
        case .dog: dogs.append((counter, name))
        case .cat: cats.append((counter, name))
        }
    }

    func dequeueAny() -> String? {
        guard let dog = dogs.first else { return dequeueCat() }
        guard let cat = cats.first else { return dequeueDog() }
        return dog.order < cat.order ? dequeueDog() : dequeueCat()
    }

    func dequeueDog() -> String? {
        return dogs.isEmpty ? nil : dogs.removeFirst().name
    }

    func dequeueCat() -> String? {
        return cats.isEmpty ? nil : cats.removeFirst().name
    }
}
