// Solutions for Lesson 17 (CtCI Chapter 4). Compare with the book on PDF page 253.
import Support

func inOrder(_ node: TreeNode?) -> [Int] {
    guard let node else { return [] }
    return inOrder(node.left) + [node.data] + inOrder(node.right)
}

func preOrder(_ node: TreeNode?) -> [Int] {
    guard let node else { return [] }
    return [node.data] + preOrder(node.left) + preOrder(node.right)
}

func height(_ node: TreeNode?) -> Int {
    guard let node else { return 0 }
    return 1 + max(height(node.left), height(node.right))
}

func routeExists(_ graph: [String: [String]], from start: String, to end: String) -> Bool {
    var visited: Set = [start]
    var queue = [start]
    var head = 0
    while head < queue.count {
        let node = queue[head]
        head += 1
        if node == end { return true }
        for next in graph[node, default: []] where visited.insert(next).inserted {
            queue.append(next)
        }
    }
    return false
}

func minimalTree(_ sorted: [Int]) -> TreeNode? {
    func build(_ lo: Int, _ hi: Int) -> TreeNode? {
        guard lo <= hi else { return nil }
        let mid = (lo + hi) / 2
        return TreeNode(sorted[mid], build(lo, mid - 1), build(mid + 1, hi))
    }
    return build(0, sorted.count - 1)
}

func listOfDepths(_ root: TreeNode?) -> [[Int]] {
    var levels: [[Int]] = []
    var current = [root].compactMap { $0 }
    while !current.isEmpty {
        levels.append(current.map { $0.data })
        current = current.flatMap { [$0.left, $0.right].compactMap { $0 } }
    }
    return levels
}

func isBalanced(_ root: TreeNode?) -> Bool {
    // Returns the height, or -1 as soon as something is unbalanced (the book's O(n) version).
    func checkHeight(_ node: TreeNode?) -> Int {
        guard let node else { return 0 }
        let left = checkHeight(node.left)
        if left == -1 { return -1 }
        let right = checkHeight(node.right)
        if right == -1 || abs(left - right) > 1 { return -1 }
        return 1 + max(left, right)
    }
    return checkHeight(root) != -1
}

func isValidBST(_ root: TreeNode?) -> Bool {
    func check(_ node: TreeNode?, _ lo: Int?, _ hi: Int?) -> Bool {
        guard let node else { return true }
        if let lo, node.data <= lo { return false }
        if let hi, node.data >= hi { return false }
        return check(node.left, lo, node.data) && check(node.right, node.data, hi)
    }
    return check(root, nil, nil)
}

func buildOrder(_ projects: [String], _ dependencies: [(String, String)]) -> [String]? {
    var incoming = Dictionary(uniqueKeysWithValues: projects.map { ($0, 0) })
    var children: [String: [String]] = [:]
    for (a, b) in dependencies {
        children[a, default: []].append(b)
        incoming[b, default: 0] += 1
    }
    var ready = projects.filter { incoming[$0] == 0 }
    var order: [String] = []
    var head = 0
    while head < ready.count {
        let p = ready[head]
        head += 1
        order.append(p)
        for c in children[p, default: []] {
            incoming[c]! -= 1
            if incoming[c] == 0 { ready.append(c) }
        }
    }
    return order.count == projects.count ? order : nil
}

func firstCommonAncestor(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
    guard let root else { return nil }
    if root === p || root === q { return root }
    let left = firstCommonAncestor(root.left, p, q)
    let right = firstCommonAncestor(root.right, p, q)
    if left != nil && right != nil { return root }
    return left ?? right
}

func pathsWithSum(_ root: TreeNode?, _ target: Int) -> Int {
    // Prefix sums (the book's optimized O(n) solution).
    var counts: [Int: Int] = [0: 1]
    func walk(_ node: TreeNode?, _ running: Int) -> Int {
        guard let node else { return 0 }
        let sum = running + node.data
        var total = counts[sum - target, default: 0]
        counts[sum, default: 0] += 1
        total += walk(node.left, sum) + walk(node.right, sum)
        counts[sum]! -= 1
        return total
    }
    return walk(root, 0)
}
