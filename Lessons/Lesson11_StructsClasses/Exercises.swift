// =============================================================================
//  LESSON 11 — EXERCISES — fill in the methods.
// =============================================================================

import Support

struct Rectangle {
    var width: Int
    var height: Int

    /// width × height
    func area() -> Int {
        todo()
        return -1
    }

    /// The distance around the rectangle.
    func perimeter() -> Int {
        todo()
        return -1
    }

    /// true if width == height
    var isSquare: Bool {
        todo()
        return false
    }

    /// Multiply both sides by factor (this CHANGES the rectangle).
    mutating func scale(by factor: Int) {
        todo()
    }
}

class BankAccount {
    let owner: String
    private(set) var balance: Int       // others can READ balance, only this class can change it

    init(owner: String, balance: Int = 0) {
        self.owner = owner
        self.balance = balance
    }

    /// Add amount to the balance. Ignore amounts <= 0 (do nothing).
    func deposit(_ amount: Int) {
        todo()
    }

    /// Take amount out and return true — but if there isn't enough money,
    /// change nothing and return false.
    func withdraw(_ amount: Int) -> Bool {
        todo()
        return false
    }
}

/// Counts how many times each word was added.
///   let c = WordCounter()
///   c.add("x"); c.add("x"); c.add("y")
///   c.count(of: "x") → 2     c.count(of: "z") → 0     c.mostCommon() → "x"
class WordCounter {
    private var counts: [String: Int] = [:]

    func add(_ word: String) {
        todo()
    }

    func count(of word: String) -> Int {
        todo()
        return -1
    }

    /// The word with the highest count, or nil if nothing was added.
    func mostCommon() -> String? {
        todo()
        return "?"
    }
}

enum TrafficLight {
    case red, yellow, green

    /// red → green → yellow → red
    func next() -> TrafficLight {
        todo()
        return self
    }

    /// red: 30 seconds, yellow: 5, green: 25
    var seconds: Int {
        todo()
        return -1
    }
}

/// A chain of nodes, like in main.swift. Don't change this class.
class ChainNode {
    var data: Int
    var next: ChainNode?
    init(_ data: Int, next: ChainNode? = nil) {
        self.data = data
        self.next = next
    }
}

/// Walk the chain starting at head and collect the data into an array.
/// 1 → 2 → 3 → nil   gives  [1, 2, 3].    nil gives [].
func chainToArray(_ head: ChainNode?) -> [Int] {
    todo()
    return [-1]
}

/// The opposite: build 1 → 2 → 3 from [1, 2, 3] and return the FIRST node.
/// Return nil for an empty array.
/// Hint: build from the back: for value in values.reversed() { head = ChainNode(value, next: head) }
func arrayToChain(_ values: [Int]) -> ChainNode? {
    todo()
    return ChainNode(-1)
}
