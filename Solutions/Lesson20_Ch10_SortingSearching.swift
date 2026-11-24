// Solutions for Lesson 20 (CtCI Chapter 10). Compare with the book on PDF page 408.
import Support

func mergeSort(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else { return nums }
    let mid = nums.count / 2
    let left = mergeSort(Array(nums[..<mid]))
    let right = mergeSort(Array(nums[mid...]))
    var out: [Int] = []
    out.reserveCapacity(nums.count)
    var i = 0, j = 0
    while i < left.count && j < right.count {
        if left[i] <= right[j] {
            out.append(left[i]); i += 1
        } else {
            out.append(right[j]); j += 1
        }
    }
    return out + left[i...] + right[j...]
}

func quickSort(_ nums: [Int]) -> [Int] {
    guard nums.count > 1 else { return nums }
    let pivot = nums[nums.count / 2]
    let smaller = nums.filter { $0 < pivot }
    let equal = nums.filter { $0 == pivot }
    let bigger = nums.filter { $0 > pivot }
    return quickSort(smaller) + equal + quickSort(bigger)
}

func binarySearch(_ nums: [Int], _ target: Int) -> Int? {
    var lo = 0, hi = nums.count - 1
    while lo <= hi {
        let mid = (lo + hi) / 2
        if nums[mid] == target { return mid }
        if nums[mid] < target { lo = mid + 1 } else { hi = mid - 1 }
    }
    return nil
}

func sortedMerge(_ a: inout [Int], _ b: [Int]) {
    var i = a.count - b.count - 1      // last real item of a
    var j = b.count - 1                // last item of b
    var write = a.count - 1
    while j >= 0 {
        if i >= 0 && a[i] > b[j] {
            a[write] = a[i]; i -= 1
        } else {
            a[write] = b[j]; j -= 1
        }
        write -= 1
    }
}

func groupAnagrams(_ words: [String]) -> [String] {
    var groups: [String: [String]] = [:]
    var order: [String] = []           // remember the order groups first appeared
    for w in words {
        let key = String(w.sorted())
        if groups[key] == nil { order.append(key) }
        groups[key, default: []].append(w)
    }
    return order.flatMap { groups[$0]! }
}

func searchRotated(_ nums: [Int], _ target: Int) -> Int? {
    var lo = 0, hi = nums.count - 1
    while lo <= hi {
        let mid = (lo + hi) / 2
        if nums[mid] == target { return mid }
        if nums[lo] <= nums[mid] {                 // left half is in normal order
            if nums[lo] <= target && target < nums[mid] { hi = mid - 1 } else { lo = mid + 1 }
        } else {                                   // right half is in normal order
            if nums[mid] < target && target <= nums[hi] { lo = mid + 1 } else { hi = mid - 1 }
        }
    }
    return nil
}

func sortedMatrixSearch(_ matrix: [[Int]], _ target: Int) -> [Int]? {
    guard let firstRow = matrix.first else { return nil }
    var r = 0, c = firstRow.count - 1
    while r < matrix.count && c >= 0 {
        let value = matrix[r][c]
        if value == target { return [r, c] }
        if value > target { c -= 1 } else { r += 1 }
    }
    return nil
}

func peaksAndValleys(_ nums: inout [Int]) {
    // Make every odd index a valley: swap in the smallest of its neighbors. O(n).
    var i = 1
    while i < nums.count {
        var smallest = i
        if nums[i - 1] < nums[smallest] { smallest = i - 1 }
        if i + 1 < nums.count && nums[i + 1] < nums[smallest] { smallest = i + 1 }
        nums.swapAt(i, smallest)
        i += 2
    }
}

func firstBadVersion(_ n: Int, _ isBad: (Int) -> Bool) -> Int {
    var lo = 1, hi = n
    while lo < hi {
        let mid = (lo + hi) / 2
        if isBad(mid) { hi = mid } else { lo = mid + 1 }
    }
    return lo
}
