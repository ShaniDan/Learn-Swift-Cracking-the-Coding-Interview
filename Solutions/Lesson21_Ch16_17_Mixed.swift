// Solutions for Lesson 21 (CtCI Chapters 16 & 17). Compare with the book on PDF pages 474 and 542.
import Support

func numberSwapper(_ a: Int, _ b: Int) -> (Int, Int) {
    var a = a, b = b
    a = a - b      // a holds the difference
    b = a + b      // (a - b) + b = the original a
    a = b - a      // original a - (a - b) = the original b
    return (a, b)
}

func factorialZeros(_ n: Int) -> Int {
    var count = 0
    var power = 5
    while power <= n {
        count += n / power      // multiples of 5, 25, 125, ... each add a factor of 5
        if power > Int.max / 5 { break }
        power *= 5
    }
    return count
}

func smallestDifference(_ a: [Int], _ b: [Int]) -> Int {
    let a = a.sorted(), b = b.sorted()
    var i = 0, j = 0
    var best = Int.max
    while i < a.count && j < b.count {
        best = min(best, abs(a[i] - b[j]))
        if a[i] < b[j] { i += 1 } else { j += 1 }
    }
    return best
}

func maxSubarraySum(_ nums: [Int]) -> Int {
    var best = nums[0], current = nums[0]
    for x in nums.dropFirst() {
        current = max(x, current + x)
        best = max(best, current)
    }
    return best
}

func pairsWithSum(_ nums: [Int], _ target: Int) -> [[Int]] {
    var seen = Set<Int>()
    var pairs = Set<[Int]>()
    for x in nums {
        let other = target - x
        if seen.contains(other) {
            pairs.insert([min(x, other), max(x, other)])
        }
        seen.insert(x)
    }
    return pairs.sorted { $0[0] < $1[0] }
}

/// The book's approach: Dictionary for O(1) lookup + doubly linked list for usage order.
class LRUCache {
    private final class Node {
        let key: Int
        var value: Int
        var prev: Node?
        var next: Node?
        init(_ key: Int, _ value: Int) { self.key = key; self.value = value }
    }

    let capacity: Int
    private var map: [Int: Node] = [:]
    private let head = Node(0, 0)     // dummy: head.next is the MOST recently used
    private let tail = Node(0, 0)     // dummy: tail.prev is the LEAST recently used

    init(capacity: Int) {
        self.capacity = capacity
        head.next = tail
        tail.prev = head
    }

    private func unlink(_ node: Node) {
        node.prev?.next = node.next
        node.next?.prev = node.prev
    }

    private func pushFront(_ node: Node) {
        node.next = head.next
        node.prev = head
        head.next?.prev = node
        head.next = node
    }

    func get(_ key: Int) -> Int? {
        guard let node = map[key] else { return nil }
        unlink(node)
        pushFront(node)
        return node.value
    }

    func put(_ key: Int, _ value: Int) {
        if let node = map[key] {
            node.value = value
            unlink(node)
            pushFront(node)
            return
        }
        let node = Node(key, value)
        map[key] = node
        pushFront(node)
        if map.count > capacity, let oldest = tail.prev, oldest !== head {
            unlink(oldest)
            map[oldest.key] = nil
        }
    }
}

func missingNumber(_ nums: [Int]) -> Int {
    let n = nums.count
    return n * (n + 1) / 2 - nums.reduce(0, +)
}

func majorityElement(_ nums: [Int]) -> Int? {
    var candidate = 0, count = 0
    for x in nums {                       // Boyer–Moore voting
        if count == 0 { candidate = x }
        count += x == candidate ? 1 : -1
    }
    let occurrences = nums.filter { $0 == candidate }.count
    return occurrences * 2 > nums.count ? candidate : nil
}

func smallestK(_ nums: [Int], _ k: Int) -> [Int] {
    return Array(nums.sorted().prefix(k))
}

func masseuse(_ appointments: [Int]) -> Int {
    var take = 0, skip = 0               // best totals if we took / skipped the previous one
    for minutes in appointments {
        (take, skip) = (skip + minutes, max(take, skip))
    }
    return max(take, skip)
}

func histogramVolume(_ heights: [Int]) -> Int {
    let n = heights.count
    guard n > 0 else { return 0 }
    var leftMax = Array(repeating: 0, count: n)
    var rightMax = Array(repeating: 0, count: n)
    var tallest = 0
    for i in 0..<n {
        tallest = max(tallest, heights[i])
        leftMax[i] = tallest
    }
    tallest = 0
    for i in stride(from: n - 1, through: 0, by: -1) {
        tallest = max(tallest, heights[i])
        rightMax[i] = tallest
    }
    return (0..<n).reduce(0) { $0 + min(leftMax[$1], rightMax[$1]) - heights[$1] }
}

func livingPeople(_ people: [[Int]]) -> Int {
    var delta = Array(repeating: 0, count: 102)      // years 1900...2001
    for person in people {
        delta[person[0] - 1900] += 1
        delta[person[1] - 1900 + 1] -= 1
    }
    var bestYear = 1900, best = -1, alive = 0
    for i in 0...100 {
        alive += delta[i]
        if alive > best {
            best = alive
            bestYear = 1900 + i
        }
    }
    return bestYear
}
