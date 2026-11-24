// Solutions for Lesson 09.
import Support

func charCounts(_ s: String) -> [Character: Int] {
    var counts: [Character: Int] = [:]
    for ch in s {
        counts[ch, default: 0] += 1
    }
    return counts
}

func mostCommonChar(_ s: String) -> Character? {
    let counts = charCounts(s)
    var best: Character? = nil
    var bestCount = 0
    for (ch, count) in counts where count > bestCount {
        best = ch
        bestCount = count
    }
    return best
    // Shorter: return charCounts(s).max { $0.value < $1.value }?.key
}

func isUnique(_ s: String) -> Bool {
    var seen = Set<Character>()
    for ch in s {
        if !seen.insert(ch).inserted { return false }
    }
    return true
}

func isPermutation(_ a: String, _ b: String) -> Bool {
    return a.count == b.count && charCounts(a) == charCounts(b)
}

func wordLengths(_ words: [String]) -> [String: Int] {
    var out: [String: Int] = [:]
    for w in words {
        out[w] = w.count
    }
    return out
}

func groupByLength(_ words: [String]) -> [Int: [String]] {
    var groups: [Int: [String]] = [:]
    for w in words {
        groups[w.count, default: []].append(w)
    }
    return groups
}

func commonItems(_ a: [Int], _ b: [Int]) -> [Int] {
    return Set(a).intersection(Set(b)).sorted()
}

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var seen: [Int: Int] = [:]          // number → index
    for (i, n) in nums.enumerated() {
        if let j = seen[target - n] {
            return [j, i]
        }
        seen[n] = i
    }
    return []
}

func firstUniqueChar(_ s: String) -> Int {
    let counts = charCounts(s)
    for (i, ch) in s.enumerated() where counts[ch] == 1 {
        return i
    }
    return -1
}
