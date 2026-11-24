import Testing
import Support
@testable import Lesson14_Ch1_ArraysStrings

@Suite("Lesson 14 · Ch 1 Arrays & Strings")
struct Lesson14Checks {
    @Test("1.1 isUnique", .disabled(if: Todo.notStarted { _ = isUnique("") }, "⏭ not started"))
    func check_isUnique() {
        for (s, want) in [("abcdef", true), ("abcdea", false), ("", true), ("a", true), ("aA", true), ("  ", false)] {
            #expect(isUnique(s) == want, "isUnique(\"\(s)\")")
        }
    }

    @Test("1.2 checkPermutation", .disabled(if: Todo.notStarted { _ = checkPermutation("", "") }, "⏭ not started"))
    func check_checkPermutation() {
        let cases = [("abc", "bca", true), ("abc", "abd", false), ("aabb", "abab", true), ("aab", "abb", false),
                     ("abc", "abcd", false), ("Abc", "abc", false), ("", "", true)]
        for (a, b, want) in cases {
            #expect(checkPermutation(a, b) == want, "checkPermutation(\"\(a)\", \"\(b)\")")
        }
    }

    @Test("1.3 urlify", .disabled(if: Todo.notStarted { _ = urlify("", 0) }, "⏭ not started"))
    func check_urlify() {
        #expect(urlify("Mr John Smith    ", 13) == "Mr%20John%20Smith")
        #expect(urlify("nospace", 7) == "nospace")
        #expect(urlify(" a  ", 2) == "%20a")
    }

    @Test("1.4 palindromePermutation", .disabled(if: Todo.notStarted { _ = palindromePermutation("") }, "⏭ not started"))
    func check_palindromePermutation() {
        let cases = [("Tact Coa", true), ("aab", true), ("abc", false), ("", true), ("a", true),
                     ("aabbccd", true), ("aabbcd", false), ("Race car", true)]
        for (s, want) in cases {
            #expect(palindromePermutation(s) == want, "palindromePermutation(\"\(s)\")")
        }
    }

    @Test("1.5 oneAway", .disabled(if: Todo.notStarted { _ = oneAway("", "") }, "⏭ not started"))
    func check_oneAway() {
        let cases = [("pale", "ple", true), ("pales", "pale", true), ("pale", "bale", true), ("pale", "bake", false),
                     ("pale", "pale", true), ("", "a", true), ("a", "abc", false), ("abc", "acb", false),
                     ("ple", "pale", true)]
        for (a, b, want) in cases {
            #expect(oneAway(a, b) == want, "oneAway(\"\(a)\", \"\(b)\")")
        }
    }

    @Test("1.6 compress", .disabled(if: Todo.notStarted { _ = compress("") }, "⏭ not started"))
    func check_compress() {
        let cases = [("aabcccccaaa", "a2b1c5a3"), ("abc", "abc"), ("", ""), ("aaaa", "a4"), ("aabb", "aabb"), ("AAAaaa", "A3a3")]
        for (s, want) in cases {
            #expect(compress(s) == want, "compress(\"\(s)\")")
        }
    }

    @Test("1.7 rotateMatrix", .disabled(if: Todo.notStarted { var m = [[1]]; rotateMatrix(&m) }, "⏭ not started"))
    func check_rotateMatrix() {
        let cases: [([[Int]], [[Int]])] = [
            ([[1, 2, 3], [4, 5, 6], [7, 8, 9]], [[7, 4, 1], [8, 5, 2], [9, 6, 3]]),
            ([[1, 2], [3, 4]], [[3, 1], [4, 2]]),
            ([[1]], [[1]]),
            ([[1, 2, 3, 4], [5, 6, 7, 8], [9, 10, 11, 12], [13, 14, 15, 16]],
             [[13, 9, 5, 1], [14, 10, 6, 2], [15, 11, 7, 3], [16, 12, 8, 4]]),
        ]
        for (before, after) in cases {
            var m = before
            rotateMatrix(&m)
            #expect(m == after, "rotateMatrix(\(before))")
        }
    }

    @Test("1.8 zeroMatrix", .disabled(if: Todo.notStarted { var m = [[1]]; zeroMatrix(&m) }, "⏭ not started"))
    func check_zeroMatrix() {
        let cases: [([[Int]], [[Int]])] = [
            ([[1, 2, 3], [4, 0, 6], [7, 8, 9]], [[1, 0, 3], [0, 0, 0], [7, 0, 9]]),
            ([[0, 1, 2], [3, 4, 5]], [[0, 0, 0], [0, 4, 5]]),
            ([[1, 2], [3, 4]], [[1, 2], [3, 4]]),
            ([[1, 0, 1, 1], [1, 1, 1, 0], [1, 1, 1, 1]], [[0, 0, 0, 0], [0, 0, 0, 0], [1, 0, 1, 0]]),
        ]
        for (before, after) in cases {
            var m = before
            zeroMatrix(&m)
            #expect(m == after, "zeroMatrix(\(before))")
        }
    }

    @Test("1.9 isRotation", .disabled(if: Todo.notStarted { _ = isRotation("", "") }, "⏭ not started"))
    func check_isRotation() {
        let cases = [("waterbottle", "erbottlewat", true), ("waterbottle", "erbottlewta", false),
                     ("abc", "abcd", false), ("aa", "aa", true), ("", "", true), ("ab", "ba", true)]
        for (a, b, want) in cases {
            #expect(isRotation(a, b) == want, "isRotation(\"\(a)\", \"\(b)\")")
        }
    }
}
