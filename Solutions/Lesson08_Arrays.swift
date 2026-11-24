// Solutions for Lesson 08.
import Support

func findMax(_ nums: [Int]) -> Int {
    var biggest = nums[0]
    for n in nums where n > biggest {
        biggest = n
    }
    return biggest
}

func countEvens(_ nums: [Int]) -> Int {
    var count = 0
    for n in nums where n % 2 == 0 {
        count += 1
    }
    return count
}

func reversedCopy(_ nums: [Int]) -> [Int] {
    var out: [Int] = []
    var i = nums.count - 1
    while i >= 0 {
        out.append(nums[i])
        i -= 1
    }
    return out
}

func reverseInPlace(_ nums: inout [Int]) {
    var left = 0, right = nums.count - 1
    while left < right {
        nums.swapAt(left, right)
        left += 1
        right -= 1
    }
}

func removeDuplicates(_ nums: [Int]) -> [Int] {
    var out: [Int] = []
    for n in nums where !out.contains(n) {
        out.append(n)
    }
    return out
}

func secondLargest(_ nums: [Int]) -> Int? {
    let distinct = removeDuplicates(nums).sorted()
    return distinct.count < 2 ? nil : distinct[distinct.count - 2]
}

func makeGrid(rows: Int, cols: Int, value: Int) -> [[Int]] {
    return Array(repeating: Array(repeating: value, count: cols), count: rows)
}

func column(_ grid: [[Int]], _ c: Int) -> [Int] {
    var out: [Int] = []
    for row in grid {
        out.append(row[c])
    }
    return out
}

func mergeSorted(_ a: [Int], _ b: [Int]) -> [Int] {
    var out: [Int] = []
    var i = 0, j = 0
    while i < a.count && j < b.count {
        if a[i] <= b[j] {
            out.append(a[i]); i += 1
        } else {
            out.append(b[j]); j += 1
        }
    }
    out += a[i...]      // one of these is empty; the other holds the leftovers
    out += b[j...]
    return out
}

func moveZeros(_ nums: inout [Int]) {
    var write = 0
    for read in nums.indices where nums[read] != 0 {
        nums.swapAt(write, read)
        write += 1
    }
}
