import Testing
import Support
@testable import Lesson17_Ch4_TreesGraphs

private func values(_ n: TreeNode?) -> [Int] {
    guard let n else { return [] }
    return values(n.left) + [n.data] + values(n.right)
}

private func depth(_ n: TreeNode?) -> Int {
    guard let n else { return 0 }
    return 1 + max(depth(n.left), depth(n.right))
}

@Suite("Lesson 17 · Ch 4 Trees & Graphs")
struct Lesson17Checks {
    @Test("inOrder", .disabled(if: Todo.notStarted { _ = inOrder(nil) }, "⏭ not started"))
    func check_inOrder() {
        #expect(inOrder(sampleTree()) == [2, 4, 6, 8, 10, 20])
        #expect(inOrder(nil) == [])
    }

    @Test("preOrder", .disabled(if: Todo.notStarted { _ = preOrder(nil) }, "⏭ not started"))
    func check_preOrder() {
        #expect(preOrder(sampleTree()) == [8, 4, 2, 6, 10, 20])
        #expect(preOrder(nil) == [])
    }

    @Test("height", .disabled(if: Todo.notStarted { _ = height(nil) }, "⏭ not started"))
    func check_height() {
        #expect(height(nil) == 0)
        #expect(height(TreeNode(1)) == 1)
        #expect(height(sampleTree()) == 3)
        #expect(height(TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4))))) == 4)
    }

    @Test("4.1 routeExists", .disabled(if: Todo.notStarted { _ = routeExists([:], from: "A", to: "A") }, "⏭ not started"))
    func check_routeExists() {
        let g = ["A": ["B", "C"], "B": ["D"], "C": ["D", "A"], "D": [], "E": ["A"]]
        #expect(routeExists(g, from: "A", to: "D") == true)
        #expect(routeExists(g, from: "D", to: "A") == false)
        #expect(routeExists(g, from: "E", to: "D") == true)
        #expect(routeExists(g, from: "A", to: "E") == false)
        #expect(routeExists(g, from: "A", to: "A") == true)
    }

    @Test("4.2 minimalTree", .disabled(if: Todo.notStarted { _ = minimalTree([]) }, "⏭ not started"))
    func check_minimalTree() {
        for input in [Array(1...7), Array(1...10), [5], []] {
            let tree = minimalTree(input)
            #expect(values(tree) == input, "in-order values of minimalTree(\(input)) should be the input")
            let best = input.isEmpty ? 0 : Int.bitWidth - input.count.leadingZeroBitCount
            #expect(depth(tree) == best, "minimalTree(\(input)) has height \(depth(tree)), but \(best) is possible")
        }
    }

    @Test("4.3 listOfDepths", .disabled(if: Todo.notStarted { _ = listOfDepths(nil) }, "⏭ not started"))
    func check_listOfDepths() {
        #expect(listOfDepths(sampleTree()) == [[8], [4, 10], [2, 6, 20]])
        #expect(listOfDepths(nil) == [])
    }

    @Test("4.4 isBalanced", .disabled(if: Todo.notStarted { _ = isBalanced(nil) }, "⏭ not started"))
    func check_isBalanced() {
        #expect(isBalanced(sampleTree()) == true, "sample tree")
        #expect(isBalanced(nil) == true, "empty tree")
        #expect(isBalanced(TreeNode(1, TreeNode(2, TreeNode(3)))) == false, "a chain of 3 going left")
        #expect(isBalanced(TreeNode(1, TreeNode(2, TreeNode(3), TreeNode(4)), TreeNode(5))) == true,
                "heights differ by exactly 1")
        let tricky = TreeNode(1, TreeNode(2, TreeNode(3, TreeNode(4))), TreeNode(5, nil, TreeNode(6, nil, TreeNode(7))))
        #expect(isBalanced(tricky) == false, "the root looks balanced, but its children aren't")
    }

    @Test("4.5 isValidBST", .disabled(if: Todo.notStarted { _ = isValidBST(nil) }, "⏭ not started"))
    func check_isValidBST() {
        #expect(isValidBST(sampleTree()) == true, "sample BST")
        #expect(isValidBST(nil) == true, "empty tree")
        #expect(isValidBST(TreeNode(5, TreeNode(3), TreeNode(4))) == false, "right child smaller than root")
        #expect(isValidBST(TreeNode(10, TreeNode(5, nil, TreeNode(12)), TreeNode(15))) == false,
                "12 is in the LEFT subtree of 10 — the classic trap!")
        #expect(isValidBST(TreeNode(10, TreeNode(5), TreeNode(15, TreeNode(6), TreeNode(20)))) == false,
                "6 is in the RIGHT subtree of 10")
    }

    @Test("4.7 buildOrder", .disabled(if: Todo.notStarted { _ = buildOrder([], []) }, "⏭ not started"))
    func check_buildOrder() {
        let projects = ["a", "b", "c", "d", "e", "f"]
        let deps = [("a", "d"), ("f", "b"), ("b", "d"), ("f", "a"), ("d", "c")]
        let order = buildOrder(projects, deps)
        #expect(order?.sorted() == projects, "every project must appear exactly once: got \(String(describing: order))")
        if let order, order.sorted() == projects {
            let position = Dictionary(uniqueKeysWithValues: order.enumerated().map { ($1, $0) })
            for (a, b) in deps {
                #expect(position[a]! < position[b]!, "\(a) must come before \(b) in \(order)")
            }
        }
        #expect(buildOrder(["a", "b", "c"], [("a", "b"), ("b", "c"), ("c", "a")]) == nil, "a cycle → nil")
        #expect(buildOrder(["x"], []) == ["x"])
    }

    @Test("4.8 firstCommonAncestor", .disabled(if: Todo.notStarted {
        let t = TreeNode(1); _ = firstCommonAncestor(t, t, t)
    }, "⏭ not started"))
    func check_firstCommonAncestor() {
        let n7 = TreeNode(7), n8 = TreeNode(8), n4 = TreeNode(4), n6 = TreeNode(6)
        let n5 = TreeNode(5, n7, n8)
        let n2 = TreeNode(2, n4, n5)
        let n3 = TreeNode(3, nil, n6)
        let root = TreeNode(1, n2, n3)
        for (p, q, want) in [(n7, n8, n5), (n4, n8, n2), (n7, n6, root), (n2, n8, n2), (n4, n4, n4)] {
            let got = firstCommonAncestor(root, p, q)
            #expect(got === want, "firstCommonAncestor(\(p.data), \(q.data)) should be node \(want.data), got \(got?.data as Any)")
        }
    }

    @Test("4.12 pathsWithSum", .disabled(if: Todo.notStarted { _ = pathsWithSum(nil, 0) }, "⏭ not started"))
    func check_pathsWithSum() {
        let t = TreeNode(10,
                         TreeNode(5, TreeNode(3, TreeNode(3), TreeNode(-2)), TreeNode(2, nil, TreeNode(1))),
                         TreeNode(-3, nil, TreeNode(11)))
        #expect(pathsWithSum(t, 8) == 3, "the 3 paths are 5→3, 5→2→1 and -3→11")
        #expect(pathsWithSum(nil, 0) == 0)
        #expect(pathsWithSum(TreeNode(1, TreeNode(1, TreeNode(1))), 2) == 2)
    }
}
