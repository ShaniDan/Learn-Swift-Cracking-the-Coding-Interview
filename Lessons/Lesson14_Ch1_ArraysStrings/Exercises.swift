// =============================================================================
//  LESSON 14 — EXERCISES: the book's Chapter 1 problems
//  (Described in my own words — read the exact wording in the book.
//   Problem numbers match the book.)
// =============================================================================

import Support

/// 1.1 Is Unique — true if every character in s is different.
/// Book follow-up: can you do it WITHOUT a Set or Dictionary?
/// (Idea: sort the characters, then compare neighbors.)
func isUnique(_ s: String) -> Bool {
    todo()
    return false
}

/// 1.2 Check Permutation — true if one string is a rearrangement of the other.
/// Case matters, spaces count.   "abc", "bca" → true
func checkPermutation(_ a: String, _ b: String) -> Bool {
    todo()
    return false
}

/// 1.3 URLify — s has extra spaces at the end; only the first trueLength
/// characters are "real". Replace each space in the real part with "%20".
/// urlify("Mr John Smith    ", 13) → "Mr%20John%20Smith"
/// (The book does it IN PLACE in a character array, walking BACKWARDS from
/// the end. Try that with var chars = Array(s) as a bonus!)
func urlify(_ s: String, _ trueLength: Int) -> String {
    todo()
    return ""
}

/// 1.4 Palindrome Permutation — true if the letters of s could be rearranged
/// into a palindrome. Ignore spaces and upper/lower case.
/// "Tact Coa" → true  (e.g. "taco cat")
/// Key insight: a palindrome has at most ONE character with an odd count.
func palindromePermutation(_ s: String) -> Bool {
    todo()
    return false
}

/// 1.5 One Away — the 3 possible edits: insert a character, remove a character,
/// or replace a character. true if a and b are zero or one edit apart.
/// "pale","ple" → true   "pales","pale" → true   "pale","bale" → true   "pale","bake" → false
func oneAway(_ a: String, _ b: String) -> Bool {
    todo()
    return false
}

/// 1.6 String Compression — "aabcccccaaa" → "a2b1c5a3".
/// If the compressed version isn't SHORTER than s, return s unchanged.
func compress(_ s: String) -> String {
    todo()
    return "?"
}

/// 1.7 Rotate Matrix — rotate an N×N matrix 90° CLOCKWISE, IN PLACE.
///     1 2 3        7 4 1
///     4 5 6   →    8 5 2
///     7 8 9        9 6 3
/// Easiest idea: transpose (swap m[i][j] with m[j][i] for j > i), then
/// reverse each row. The book goes layer by layer — try both!
func rotateMatrix(_ matrix: inout [[Int]]) {
    todo()
}

/// 1.8 Zero Matrix — if a cell is 0, set its whole row and column to 0. IN PLACE.
/// M×N (not necessarily square).
/// Trap: if you zero things while scanning, new zeros spread everywhere.
/// First record WHICH rows/columns have a zero, then zero them.
func zeroMatrix(_ matrix: inout [[Int]]) {
    todo()
}

/// 1.9 String Rotation — true if s2 is a rotation of s1:
/// "waterbottle" → "erbottlewat". Use contains only ONCE.
/// (Big hint: what does s1 + s1 contain?)
func isRotation(_ s1: String, _ s2: String) -> Bool {
    todo()
    return false
}
