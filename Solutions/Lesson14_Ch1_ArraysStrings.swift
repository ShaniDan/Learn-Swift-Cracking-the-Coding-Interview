// Solutions for Lesson 14 (CtCI Chapter 1). Compare with the book's ideas on PDF page 204.
import Support

func isUnique(_ s: String) -> Bool {
    // O(n) time with a Set:
    var seen = Set<Character>()
    for ch in s {
        if !seen.insert(ch).inserted { return false }
    }
    return true
    // No extra data structure, O(n log n):
    //   let sorted = s.sorted()
    //   for i in sorted.indices.dropFirst() where sorted[i] == sorted[i - 1] { return false }
    //   return true
}

func checkPermutation(_ a: String, _ b: String) -> Bool {
    guard a.count == b.count else { return false }
    var counts: [Character: Int] = [:]
    for ch in a { counts[ch, default: 0] += 1 }
    for ch in b {
        counts[ch, default: 0] -= 1
        if counts[ch]! < 0 { return false }
    }
    return true
}

func urlify(_ s: String, _ trueLength: Int) -> String {
    // The book's in-place, backwards approach on an array of characters:
    let real = Array(s.prefix(trueLength))
    let spaces = real.filter { $0 == " " }.count
    var chars = real + Array(repeating: Character(" "), count: spaces * 2)
    var write = chars.count - 1
    for read in stride(from: trueLength - 1, through: 0, by: -1) {
        if chars[read] == " " {
            chars[write] = "0"; chars[write - 1] = "2"; chars[write - 2] = "%"
            write -= 3
        } else {
            chars[write] = chars[read]
            write -= 1
        }
    }
    return String(chars)
    // Simple version:  String(s.prefix(trueLength)).replacing(" ", with: "%20")
}

func palindromePermutation(_ s: String) -> Bool {
    var counts: [Character: Int] = [:]
    for ch in s.lowercased() where ch != " " {
        counts[ch, default: 0] += 1
    }
    return counts.values.filter { $0 % 2 == 1 }.count <= 1
}

func oneAway(_ a: String, _ b: String) -> Bool {
    let (short, long) = a.count <= b.count ? (Array(a), Array(b)) : (Array(b), Array(a))
    guard long.count - short.count <= 1 else { return false }
    var i = 0, j = 0
    var foundDifference = false
    while i < short.count && j < long.count {
        if short[i] != long[j] {
            if foundDifference { return false }
            foundDifference = true
            if short.count == long.count { i += 1 }   // replace: move both
        } else {
            i += 1                                     // match: move short
        }
        j += 1                                         // always move long
    }
    return true
}

func compress(_ s: String) -> String {
    let chars = Array(s)
    var out = ""
    var count = 0
    for i in chars.indices {
        count += 1
        if i + 1 == chars.count || chars[i] != chars[i + 1] {
            out.append(chars[i])
            out += String(count)
            count = 0
        }
    }
    return out.count < chars.count ? out : s
}

func rotateMatrix(_ matrix: inout [[Int]]) {
    let n = matrix.count
    for i in 0..<n {                     // transpose
        for j in (i + 1)..<max(n, i + 1) {
            let tmp = matrix[i][j]
            matrix[i][j] = matrix[j][i]
            matrix[j][i] = tmp
        }
    }
    for i in 0..<n {                     // reverse each row
        matrix[i].reverse()
    }
}

func zeroMatrix(_ matrix: inout [[Int]]) {
    var zeroRows = Set<Int>(), zeroCols = Set<Int>()
    for r in matrix.indices {
        for c in matrix[r].indices where matrix[r][c] == 0 {
            zeroRows.insert(r)
            zeroCols.insert(c)
        }
    }
    for r in matrix.indices {
        for c in matrix[r].indices where zeroRows.contains(r) || zeroCols.contains(c) {
            matrix[r][c] = 0
        }
    }
}

func isRotation(_ s1: String, _ s2: String) -> Bool {
    guard s1.count == s2.count else { return false }
    if s1.isEmpty { return true }
    return (s1 + s1).contains(s2)
}
