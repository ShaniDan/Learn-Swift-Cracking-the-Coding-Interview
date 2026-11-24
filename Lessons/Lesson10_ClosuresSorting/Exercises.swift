// =============================================================================
//  LESSON 10 — EXERCISES
//  Try to write most of these in ONE line using map / filter / reduce / sorted.
// =============================================================================

import Support

/// Given a pair (a, b), return (b, a).
func swapPair(_ pair: (Int, Int)) -> (Int, Int) {
    todo()
    return (-1, -1)
}

/// The squares of only the odd numbers.  squaresOfOdds([1, 2, 3, 4, 5]) → [1, 9, 25]
func squaresOfOdds(_ nums: [Int]) -> [Int] {
    todo()
    return [-1]
}

/// The sum of the numbers using reduce.
func total(_ nums: [Int]) -> Int {
    todo()
    return -1
}

/// Words sorted shortest-first; words of equal length in alphabetical order.
/// sortByLength(["ccc", "b", "a", "dd"]) → ["a", "b", "dd", "ccc"]
func sortByLength(_ words: [String]) -> [String] {
    todo()
    return ["?"]
}

/// students are (name, grade) pairs. Return the NAMES sorted by grade from
/// highest to lowest; ties broken by name A→Z.
/// [("Bo", 90), ("Ann", 90), ("Cy", 95)] → ["Cy", "Ann", "Bo"]
func rankStudents(_ students: [(name: String, grade: Int)]) -> [String] {
    todo()
    return ["?"]
}

/// true if a and b are anagrams (ignore upper/lower case). Use sorting.
/// areAnagrams("Listen", "Silent") → true
func areAnagrams(_ a: String, _ b: String) -> Bool {
    todo()
    return false
}

/// Build a dictionary from two arrays.  pairUp(["a", "b"], [1, 2]) → ["a": 1, "b": 2]
func pairUp(_ keys: [String], _ values: [Int]) -> [String: Int] {
    todo()
    return ["?": -1]
}

/// p and q are (x, y) points. Return |x1 - x2| + |y1 - y2|.
func manhattanDistance(_ p: (Int, Int), _ q: (Int, Int)) -> Int {
    todo()
    return -1
}

/// The up/down/left/right neighbors of cell (r, c) that are inside a grid of
/// the given size, as [row, col] arrays, in the order up, down, left, right.
/// neighbors(of: (0, 0), rows: 3, cols: 3) → [[1, 0], [0, 1]]
/// (You'll use this in grid problems like CtCI 8.2 Robot in a Grid.)
func neighbors(of cell: (Int, Int), rows: Int, cols: Int) -> [[Int]] {
    todo()
    return [[-1]]
}

/// Parse the numbers in a list of strings, ignoring anything that isn't a number,
/// and return them sorted.  numbersIn(["10", "x", "3", "7y"]) → [3, 10]
/// Hint: compactMap.
func numbersIn(_ items: [String]) -> [Int] {
    todo()
    return [-1]
}
