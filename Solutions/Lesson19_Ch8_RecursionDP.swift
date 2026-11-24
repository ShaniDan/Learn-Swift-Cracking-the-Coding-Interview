// Solutions for Lesson 19 (CtCI Chapter 8). Compare with the book on PDF page 354.
import Support

func sumArray(_ nums: [Int]) -> Int {
    guard let first = nums.first else { return 0 }
    return first + sumArray(Array(nums.dropFirst()))
}

func fib(_ n: Int) -> Int {
    var memo: [Int: Int] = [:]
    func go(_ k: Int) -> Int {
        if k < 2 { return k }
        if let saved = memo[k] { return saved }
        let result = go(k - 1) + go(k - 2)
        memo[k] = result
        return result
    }
    return go(n)
}

func tripleStep(_ n: Int) -> Int {
    var memo: [Int: Int] = [:]
    func ways(_ k: Int) -> Int {
        if k < 0 { return 0 }
        if k == 0 { return 1 }
        if let saved = memo[k] { return saved }
        let result = ways(k - 1) + ways(k - 2) + ways(k - 3)
        memo[k] = result
        return result
    }
    return ways(n)
}

func robotPaths(_ grid: [[Int]]) -> Int {
    let rows = grid.count, cols = grid[0].count
    var paths = Array(repeating: Array(repeating: 0, count: cols), count: rows)   // bottom-up DP table
    for r in 0..<rows {
        for c in 0..<cols {
            if grid[r][c] == 1 {
                paths[r][c] = 0
            } else if r == 0 && c == 0 {
                paths[r][c] = 1
            } else {
                let fromTop = r > 0 ? paths[r - 1][c] : 0
                let fromLeft = c > 0 ? paths[r][c - 1] : 0
                paths[r][c] = fromTop + fromLeft
            }
        }
    }
    return paths[rows - 1][cols - 1]
}

func magicIndex(_ arr: [Int]) -> Int? {
    func search(_ lo: Int, _ hi: Int) -> Int? {
        guard lo <= hi else { return nil }
        let mid = (lo + hi) / 2
        if arr[mid] == mid { return mid }
        return arr[mid] < mid ? search(mid + 1, hi) : search(lo, mid - 1)
    }
    return search(0, arr.count - 1)
}

func powerSet(_ items: [Int]) -> [[Int]] {
    guard let first = items.first else { return [[]] }
    let rest = powerSet(Array(items.dropFirst()))
    return rest + rest.map { [first] + $0 }
}

func recursiveMultiply(_ a: Int, _ b: Int) -> Int {
    if b == 0 { return 0 }
    if b == 1 { return a }
    let half = recursiveMultiply(a, b >> 1)
    let doubled = half + half
    return b & 1 == 1 ? doubled + a : doubled
}

func hanoi(_ n: Int) -> [[String]] {
    func move(_ n: Int, _ from: String, _ spare: String, _ to: String) -> [[String]] {
        if n == 0 { return [] }
        return move(n - 1, from, to, spare) + [[from, to]] + move(n - 1, spare, from, to)
    }
    return move(n, "A", "B", "C")
}

func permutations(_ s: String) -> [String] {
    let chars = Array(s)
    if chars.count <= 1 { return [s] }
    var result: [String] = []
    for i in chars.indices {
        var rest = chars
        let ch = rest.remove(at: i)
        for p in permutations(String(rest)) {
            result.append(String(ch) + p)
        }
    }
    return result
}

func permutationsWithDups(_ s: String) -> [String] {
    var counts: [Character: Int] = [:]
    for ch in s { counts[ch, default: 0] += 1 }
    var result: [String] = []
    func build(_ prefix: String, _ remaining: Int) {
        if remaining == 0 {
            result.append(prefix)
            return
        }
        for ch in counts.keys where counts[ch]! > 0 {
            counts[ch]! -= 1
            build(prefix + String(ch), remaining - 1)
            counts[ch]! += 1                // undo the choice (backtrack)
        }
    }
    build("", s.count)
    return result
}

func parens(_ n: Int) -> [String] {
    var result: [String] = []
    func build(_ current: String, _ openLeft: Int, _ closeLeft: Int) {
        if openLeft == 0 && closeLeft == 0 {
            result.append(current)
            return
        }
        if openLeft > 0 { build(current + "(", openLeft - 1, closeLeft) }
        if closeLeft > openLeft { build(current + ")", openLeft, closeLeft - 1) }
    }
    build("", n, n)
    return result
}

func coins(_ n: Int) -> Int {
    let denominations = [25, 10, 5, 1]
    var memo: [[Int]: Int] = [:]
    func ways(_ amount: Int, _ index: Int) -> Int {
        if index == denominations.count - 1 { return 1 }     // only pennies left: one way
        if let saved = memo[[amount, index]] { return saved }
        var total = 0
        var used = 0
        while used * denominations[index] <= amount {
            total += ways(amount - used * denominations[index], index + 1)
            used += 1
        }
        memo[[amount, index]] = total
        return total
    }
    return ways(n, 0)
}
