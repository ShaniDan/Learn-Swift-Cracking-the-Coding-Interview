// The binary tree node used in this lesson. Read it, but don't change it.

final class TreeNode {
    var data: Int
    var left: TreeNode?
    var right: TreeNode?

    init(_ data: Int, _ left: TreeNode? = nil, _ right: TreeNode? = nil) {
        self.data = data
        self.left = left
        self.right = right
    }
}

/// The example tree used throughout the lesson:
///
///            8
///          /   \
///         4     10
///        / \      \
///       2   6      20
func sampleTree() -> TreeNode {
    return TreeNode(8,
                    TreeNode(4, TreeNode(2), TreeNode(6)),
                    TreeNode(10, nil, TreeNode(20)))
}
