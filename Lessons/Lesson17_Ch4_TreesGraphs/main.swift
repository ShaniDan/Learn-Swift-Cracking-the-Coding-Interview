// =============================================================================
//  LESSON 17 — CtCI Chapter 4: Trees and Graphs
// =============================================================================
//  📖 READ FIRST:   Chapter 4 intro + questions     PDF page 112
//                   (the intro is long and VERY good — read all of it)
//  ✅ SOLUTIONS:    PDF page 253
//  📖 EXTRA:        Topological Sort, PDF page 644   (for 4.7 Build Order)
//  The TreeNode class is in TreeNode.swift.
// =============================================================================


// --- 1. Binary trees --------------------------------------------------------------------------
//  Each node has data and up to two children: left and right.
//
//            8
//          /   \
//         4     10
//        / \      \
//       2   6      20
//
//  BINARY SEARCH TREE (BST): for every node, everything in its LEFT subtree is
//  smaller and everything in its RIGHT subtree is bigger. ↑ That's a BST.

let root = sampleTree()


// --- 2. Traversals — recursion makes them tiny (book PDF page 113) -----------------------------
//  in-order:    left, NODE, right   → for a BST, values come out SORTED!
//  pre-order:   NODE, left, right
//  post-order:  left, right, NODE

func printInOrder(_ node: TreeNode?) {
    guard let node else { return }        // base case: empty tree, do nothing
    printInOrder(node.left)
    print(node.data, terminator: " ")
    printInOrder(node.right)
}
printInOrder(root)                        // 2 4 6 8 10 20
print()


// --- 3. Graphs ------------------------------------------------------------------------------------
//  Nodes connected by edges. In interviews, store a graph as an "adjacency
//  list": a dictionary from each node to an array of its neighbors.

let graph: [String: [String]] = [
    "A": ["B", "C"],
    "B": ["D"],
    "C": ["D"],
    "D": [],
]
//  (A DIRECTED graph: A → B doesn't mean B → A.)


// --- 4. DFS and BFS — the two ways to explore a graph (book PDF page 117) -----------------------
//  DFS (depth-first): go deep down one path before backing up. Recursion or a stack.
//  BFS (breadth-first): visit all neighbors first, then their neighbors. A QUEUE.
//  ⚠️ Always keep a `visited` set — otherwise cycles make you loop forever.

func dfs(_ graph: [String: [String]], _ node: String, _ visited: inout Set<String>) {
    visited.insert(node)
    print(node, terminator: " ")
    for next in graph[node, default: []] where !visited.contains(next) {
        dfs(graph, next, &visited)
    }
}

func bfs(_ graph: [String: [String]], from start: String) {
    var visited: Set = [start]
    var queue = [start]
    var head = 0                           // index-based queue (O(1) dequeue)
    while head < queue.count {
        let node = queue[head]
        head += 1
        print(node, terminator: " ")
        for next in graph[node, default: []] where !visited.contains(next) {
            visited.insert(next)
            queue.append(next)
        }
    }
}

var seen = Set<String>()
dfs(graph, "A", &seen); print()           // A B D C
bfs(graph, from: "A"); print()            // A B C D
//  BFS finds the SHORTEST path (fewest edges) in an unweighted graph.


// --- 5. The recursive "shape" of almost every tree solution -----------------------------------------
//
//    func solve(_ node: TreeNode?) -> Answer {
//        guard let node else { return /* answer for an empty tree */ }
//        let left = solve(node.left)
//        let right = solve(node.right)
//        return /* combine node.data, left and right */
//    }

func countNodes(_ node: TreeNode?) -> Int {
    guard let node else { return 0 }
    return 1 + countNodes(node.left) + countNodes(node.right)
}
print("nodes:", countNodes(root))         // 6
