// Solutions for Lesson 11.
import Support

struct Rectangle {
    var width: Int
    var height: Int

    func area() -> Int {
        return width * height
    }

    func perimeter() -> Int {
        return 2 * (width + height)
    }

    var isSquare: Bool {
        return width == height
    }

    mutating func scale(by factor: Int) {
        width *= factor
        height *= factor
    }
}

class BankAccount {
    let owner: String
    private(set) var balance: Int

    init(owner: String, balance: Int = 0) {
        self.owner = owner
        self.balance = balance
    }

    func deposit(_ amount: Int) {
        guard amount > 0 else { return }
        balance += amount
    }

    func withdraw(_ amount: Int) -> Bool {
        guard amount <= balance else { return false }
        balance -= amount
        return true
    }
}

class WordCounter {
    private var counts: [String: Int] = [:]

    func add(_ word: String) {
        counts[word, default: 0] += 1
    }

    func count(of word: String) -> Int {
        return counts[word] ?? 0
    }

    func mostCommon() -> String? {
        return counts.max { $0.value < $1.value }?.key
    }
}

enum TrafficLight {
    case red, yellow, green

    func next() -> TrafficLight {
        switch self {
        case .red: return .green
        case .green: return .yellow
        case .yellow: return .red
        }
    }

    var seconds: Int {
        switch self {
        case .red: return 30
        case .yellow: return 5
        case .green: return 25
        }
    }
}

class ChainNode {
    var data: Int
    var next: ChainNode?
    init(_ data: Int, next: ChainNode? = nil) {
        self.data = data
        self.next = next
    }
}

func chainToArray(_ head: ChainNode?) -> [Int] {
    var out: [Int] = []
    var current = head
    while let node = current {
        out.append(node.data)
        current = node.next
    }
    return out
}

func arrayToChain(_ values: [Int]) -> ChainNode? {
    var head: ChainNode? = nil
    for value in values.reversed() {
        head = ChainNode(value, next: head)
    }
    return head
}
