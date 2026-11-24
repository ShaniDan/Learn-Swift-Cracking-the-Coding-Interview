// =============================================================================
//  LESSON 12 — EXERCISES
// =============================================================================

import Support

enum AgeError: Error {
    case negative
    case tooOld
}

/// Return age if it's between 0 and 150 (inclusive).
/// Throw AgeError.negative if it's below 0, AgeError.tooOld if above 150.
func validateAge(_ age: Int) throws -> Int {
    todo()
    return -1
}

/// Call validateAge using  try?  and return the age, or -1 if it threw.
func ageOrMinusOne(_ age: Int) -> Int {
    todo()
    return -2
}

enum MathError: Error {
    case divisionByZero
}

/// a / b (whole-number division). Throw MathError.divisionByZero if b is 0.
func divide(_ a: Int, by b: Int) throws -> Int {
    todo()
    return -1
}

/// Turn text into a number: an Int if possible ("42" → 42.0), otherwise a
/// Double ("3.5" → 3.5), otherwise nil ("abc" → nil).
func parseNumber(_ text: String) -> Double? {
    todo()
    return -1
}

/// 🐞 This function has a BUG. It should count the negative numbers, but
/// buggyCountNegatives([-1, -2, 3]) gives the wrong answer.
/// Use the debugger (breakpoint + Cmd+U) or print() to find and fix it.
/// Delete the todo() line when you start — then the checks will test it.
func buggyCountNegatives(_ nums: [Int]) -> Int {
    todo()
    var count = 0
    for i in 1..<max(nums.count, 1) {
        if nums[i] < 0 {
            count += 1
        }
    }
    return count
}

/// 🐞 Should return the average, or 0 for an empty array. It has TWO bugs
/// (one gives wrong answers, one CRASHES). Find and fix them.
func buggyAverage(_ nums: [Int]) -> Double {
    todo()
    var total = 0
    for n in nums {
        total = n
    }
    return Double(total / nums.count)
}
