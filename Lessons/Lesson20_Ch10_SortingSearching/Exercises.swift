// =============================================================================
//  LESSON 20 — EXERCISES: Chapter 10
// =============================================================================

import Support

/// Return a NEW sorted array using merge sort (no sort()/sorted()).
/// 1. Base case: 0 or 1 items → already sorted.
/// 2. Split in half; mergeSort each half.
/// 3. Merge the two sorted halves (you wrote mergeSorted in Lesson 08!).
func mergeSort(_ nums: [Int]) -> [Int] {
    todo()
    return [-1]
}

/// Return a NEW sorted array using quick sort (no sort()/sorted()).
/// Pick a pivot (e.g. the middle item); split into smaller / equal / bigger
/// arrays; return quickSort(smaller) + equal + quickSort(bigger).
func quickSort(_ nums: [Int]) -> [Int] {
    todo()
    return [-1]
}

/// The index of target in the sorted array, or nil. Must be O(log n).
func binarySearch(_ nums: [Int], _ target: Int) -> Int? {
    todo()
    return -1
}

/// 10.1 Sorted Merge — a and b are sorted. a has b.count extra slots of 0 at
/// its END (its "buffer"). Merge b into a IN PLACE so a is fully sorted.
/// a = [1, 4, 7, 0, 0], b = [2, 9]  →  a = [1, 2, 4, 7, 9]
/// Book trick: fill from the BACK, so you never overwrite items you haven't read.
func sortedMerge(_ a: inout [Int], _ b: [Int]) {
    todo()
}

/// 10.2 Group Anagrams — return the words reordered so anagrams are next to
/// each other. ["cat", "dog", "tac", "god", "act"] → e.g.
/// ["cat", "tac", "act", "dog", "god"]   (the order of the groups doesn't matter)
/// Hint: a dictionary from sorted letters → array of words.
func groupAnagrams(_ words: [String]) -> [String] {
    todo()
    return []
}

/// 10.3 Search in Rotated Array — nums was sorted (distinct values) and then
/// rotated: [15, 16, 19, 20, 25, 1, 3, 4, 5, 7, 10, 14]. Return the index of
/// target or nil, in O(log n).
/// Key fact: at any mid, at least ONE half (lo...mid or mid...hi) is in normal
/// sorted order. Check whether target falls inside that half's range.
func searchRotated(_ nums: [Int], _ target: Int) -> Int? {
    todo()
    return -1
}

/// 10.9 Sorted Matrix Search — every row and every column is sorted ascending.
/// Return [row, col] of target, or nil.
/// Book idea: start in the TOP-RIGHT corner. Too big → move left; too small → move down.
func sortedMatrixSearch(_ matrix: [[Int]], _ target: Int) -> [Int]? {
    todo()
    return [-1]
}

/// 10.11 Peaks and Valleys — reorder IN PLACE so values alternate:
/// nums[0] >= nums[1] <= nums[2] >= nums[3] <= ...
/// Many answers are valid; the checks verify the pattern.
/// Simple idea: sort, then swap pairs (1,2), (3,4), ...
/// Faster book idea: at every odd index, swap in the smallest of the three neighbors.
func peaksAndValleys(_ nums: inout [Int]) {
    todo()
}

/// Binary search in disguise (a Google/Meta favorite): versions 1...n; once a
/// version is bad, every later one is bad too. isBad(v) tells you whether v is
/// bad. Return the FIRST bad version using as few isBad calls as possible
/// (the checks allow about log₂(n) + 2).
func firstBadVersion(_ n: Int, _ isBad: (Int) -> Bool) -> Int {
    todo()
    return -1
}
