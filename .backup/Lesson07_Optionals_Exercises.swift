// =============================================================================
//  LESSON 07 — EXERCISES
//  (Arrays like [Int] are covered properly next lesson; here you only need
//   "for x in nums { ... }" to loop over one.)
// =============================================================================

import Support

/// Turn text into an Int, or return 0 if it isn't a number. (One line with ??)
/// parseInt("42") → 42     parseInt("hi") → 0
func parseInt(_ text: String) -> Int {
    todo()
    return -1
}

/// a / b as a Double, or nil if b is 0.
/// safeDivide(10, 4) → 2.5    safeDivide(1, 0) → nil
func safeDivide(_ a: Int, _ b: Int) -> Double? {
    todo()
    return -1
}

/// Return "Hello, NAME!" or "Hello, stranger!" when name is nil. Use guard let.
func hello(_ name: String?) -> String {
    todo()
    return ""
}

/// The number of characters in s, or 0 if s is nil. Use ?. and ??
func lengthOf(_ s: String?) -> Int {
    todo()
    return -1
}

/// The first even number in nums, or nil if there isn't one.
/// firstEven([3, 5, 8, 10]) → 8     firstEven([1, 3]) → nil
func firstEven(_ nums: [Int]) -> Int? {
    todo()
    return -1
}

/// Return the first character that appears AGAIN later in s, or nil.
/// firstRepeatedChar("abcbd") → "b"     firstRepeatedChar("abc") → nil
/// Hint: let chars = Array(s), then a loop inside a loop comparing chars[i] and chars[j].
func firstRepeatedChar(_ s: String) -> Character? {
    todo()
    return "?"
}

/// Add up the numbers, skipping the missing ones.
/// sumOfPresent([1, nil, 3]) → 4
func sumOfPresent(_ values: [Int?]) -> Int {
    todo()
    return -1
}

/// Parse "HH:MM" text into total minutes, or nil if it's not valid.
/// minutes(from: "01:30") → 90     minutes(from: "ab:cd") → nil
/// minutes(from: "1230") → nil (no colon)
/// Hint: let parts = text.split(separator: ":")  then check parts.count == 2,
/// then  guard let h = Int(parts[0]), let m = Int(parts[1]) else { return nil }
func minutes(from text: String) -> Int? {
    todo()
    return -1
}
