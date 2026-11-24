// =============================================================================
//  LESSON 08 — EXERCISES
// =============================================================================

import Support

/// The largest number WITHOUT using max(). Assume nums isn't empty.
func findMax(_ nums: [Int]) -> Int {
    todo()
    return 0
}

/// How many numbers are even?
func countEvens(_ nums: [Int]) -> Int {
    todo()
    return -1
}

/// A NEW array with the items in reverse order — build it with a loop
/// (not reversed()).   reversedCopy([1, 2, 3]) → [3, 2, 1]
func reversedCopy(_ nums: [Int]) -> [Int] {
    todo()
    return [-1]
}

/// Reverse the array IN PLACE using two pointers and swapAt (see main.swift §9).
func reverseInPlace(_ nums: inout [Int]) {
    todo()
}

/// A new array without duplicates, keeping the first occurrence.
/// removeDuplicates([3, 1, 3, 2, 1]) → [3, 1, 2]
func removeDuplicates(_ nums: [Int]) -> [Int] {
    todo()
    return [-1]
}

/// The second-largest DISTINCT value, or nil if there isn't one.
/// secondLargest([4, 1, 4, 3]) → 3     secondLargest([5, 5]) → nil
func secondLargest(_ nums: [Int]) -> Int? {
    todo()
    return -1
}

/// A rows × cols grid filled with value.
/// makeGrid(rows: 2, cols: 3, value: 0) → [[0, 0, 0], [0, 0, 0]]
func makeGrid(rows: Int, cols: Int, value: Int) -> [[Int]] {
    todo()
    return []
}

/// Column c of the grid.   column([[1, 2], [3, 4], [5, 6]], 1) → [2, 4, 6]
func column(_ grid: [[Int]], _ c: Int) -> [Int] {
    todo()
    return [-1]
}

/// a and b are each sorted. Return ONE sorted array with all their items,
/// WITHOUT calling sort()/sorted(). Walk through both with two indexes i and j,
/// always taking the smaller item. (The heart of merge sort, Lesson 20, and
/// CtCI 10.1 "Sorted Merge".)
/// mergeSorted([1, 4, 9], [2, 3, 10]) → [1, 2, 3, 4, 9, 10]
func mergeSorted(_ a: [Int], _ b: [Int]) -> [Int] {
    todo()
    return [-1]
}

/// Move all zeros to the END, keeping the order of the other numbers. IN PLACE.
/// [0, 1, 0, 3, 12] → [1, 3, 12, 0, 0]
/// Hint: keep a "write" index for the next non-zero spot.
func moveZeros(_ nums: inout [Int]) {
    todo()
}
