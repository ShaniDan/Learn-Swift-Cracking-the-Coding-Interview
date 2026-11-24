// Solutions for Lesson 12.
import Support

enum AgeError: Error {
    case negative
    case tooOld
}

func validateAge(_ age: Int) throws -> Int {
    if age < 0 { throw AgeError.negative }
    if age > 150 { throw AgeError.tooOld }
    return age
}

func ageOrMinusOne(_ age: Int) -> Int {
    return (try? validateAge(age)) ?? -1
}

enum MathError: Error {
    case divisionByZero
}

func divide(_ a: Int, by b: Int) throws -> Int {
    guard b != 0 else { throw MathError.divisionByZero }
    return a / b
}

func parseNumber(_ text: String) -> Double? {
    if let whole = Int(text) { return Double(whole) }
    return Double(text)
}

func buggyCountNegatives(_ nums: [Int]) -> Int {
    // Bug: the loop started at index 1, skipping nums[0]. Loop over every item instead.
    var count = 0
    for n in nums where n < 0 {
        count += 1
    }
    return count
}

func buggyAverage(_ nums: [Int]) -> Double {
    // Bug 1: `total = n` overwrote the total instead of adding (+=).
    // Bug 2: an empty array divided by zero → crash. Also Int / Int lost the .5.
    guard !nums.isEmpty else { return 0 }
    var total = 0
    for n in nums {
        total += n
    }
    return Double(total) / Double(nums.count)
}
