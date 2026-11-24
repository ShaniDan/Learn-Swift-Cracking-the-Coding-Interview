// Solutions for Lesson 13.
import Support

func answer1() -> String { "O(n)" }
func answer2() -> String { "O(n^2)" }
func answer3() -> String { "O(a * b)" }
func answer4() -> String { "O(log n)" }
func answer5() -> String { "O(n log n)" }
func answer6() -> String { "O(2^n)" }
func answer7() -> String { "O(n^2)" }
func answer8() -> String { "O(k)" }

func hasDuplicate(_ nums: [Int]) -> Bool {
    var seen = Set<Int>()
    for n in nums {
        if !seen.insert(n).inserted { return true }
    }
    return false
}

func countCommon(_ a: [Int], _ b: [Int]) -> Int {
    return Set(a).intersection(Set(b)).count
}

func pairSumSorted(_ nums: [Int], _ target: Int) -> Bool {
    var left = 0, right = nums.count - 1
    while left < right {
        let sum = nums[left] + nums[right]
        if sum == target { return true }
        if sum < target { left += 1 } else { right -= 1 }
    }
    return false
}

func wordFrequencies(_ words: [String], queries: [String]) -> [Int] {
    var counts: [String: Int] = [:]
    for w in words { counts[w, default: 0] += 1 }
    return queries.map { counts[$0] ?? 0 }
}
