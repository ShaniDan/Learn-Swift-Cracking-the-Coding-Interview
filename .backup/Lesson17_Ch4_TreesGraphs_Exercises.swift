// =============================================================================
//  LESSON 17 — EXERCISES: Chapter 4
//  Trees are TreeNode objects; nil is an empty tree.
// =============================================================================

import Support

/// The values in in-order (left, node, right).
func inOrder(_ node: TreeNode?) -> [Int] {
    todo()
    return [-1]
}

/// The values in pre-order (node, left, right).
func preOrder(_ node: TreeNode?) -> [Int] {
    todo()
    return [-1]
}

/// The number of nodes on the longest path from the root down to a leaf.
/// Empty tree → 0, a single node → 1.
func height(_ node: TreeNode?) -> Int {
    todo()
    return -1
}

/// 4.1 Route Between Nodes — graph is an adjacency list (directed).
/// true if there's a path from start to end. Use BFS or DFS with a visited set.
func routeExists(_ graph: [String: [String]], from start: String, to end: String) -> Bool {
    todo()
    return false
}

/// 4.2 Minimal Tree — given a sorted array of unique numbers, build a BST with
/// the smallest possible height. Return the root (nil if the array is empty).
/// Idea: the middle element is the root; recurse on the left and right halves.
func minimalTree(_ sorted: [Int]) -> TreeNode? {
    todo()
    return TreeNode(-1)
}

/// 4.3 List of Depths — one array per level, values left to right.
/// (The book uses linked lists; we use arrays.)  For the sample tree:
///   [[8], [4, 10], [2, 6, 20]]
/// Hint: BFS, one level at a time.
func listOfDepths(_ root: TreeNode?) -> [[Int]] {
    todo()
    return [[-1]]
}

/// 4.4 Check Balanced — balanced means: for EVERY node, the heights of its two
/// subtrees differ by at most 1.
func isBalanced(_ root: TreeNode?) -> Bool {
    todo()
    return false
}

/// 4.5 Validate BST — true if every node's value is bigger than ALL values in
/// its left subtree and smaller than ALL values in its right subtree (assume
/// distinct values).
/// ⚠️ Checking only left.data < node.data < right.data is NOT enough!
/// Pass down the allowed range (min, max) instead.
func isValidBST(_ root: TreeNode?) -> Bool {
    todo()
    return false
}

/// 4.7 Build Order — dependencies are (a, b) pairs meaning "b depends on a"
/// (a must be built first). Return all projects in a valid order, or nil if
/// that's impossible (a cycle).
///   projects     = ["a", "b", "c", "d", "e", "f"]
///   dependencies = [("a","d"), ("f","b"), ("b","d"), ("f","a"), ("d","c")]
///   one valid answer: ["e", "f", "a", "b", "d", "c"]
/// Hint (topological sort): count each project's incoming dependencies; keep
/// taking projects that have 0 remaining.
func buildOrder(_ projects: [String], _ dependencies: [(String, String)]) -> [String]? {
    todo()
    return []
}

/// 4.8 First Common Ancestor — p and q are nodes somewhere in the tree (NOT
/// necessarily a BST). Return the lowest node that has both in its subtree
/// (a node counts as its own descendant). Compare nodes with ===.
/// Recursive idea: if root is nil, p or q → return root. Search left and
/// right; if both sides find something, root is the answer.
func firstCommonAncestor(_ root: TreeNode?, _ p: TreeNode, _ q: TreeNode) -> TreeNode? {
    todo()
    return TreeNode(-1)
}

/// 4.12 Paths with Sum — count the downward paths (start at ANY node, go only
/// to children, end at any node) whose values add up to target.
func pathsWithSum(_ root: TreeNode?, _ target: Int) -> Int {
    todo()
    return -1
}
