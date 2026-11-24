// =============================================================================
//  LESSON 08 — Arrays
// =============================================================================
//  CtCI Chapter 1 is "Arrays and Strings". Swift's Array can grow and shrink
//  (it's like Java's ArrayList, which the book discusses on PDF page 100).
// =============================================================================


// --- 1. Creating and reading arrays -----------------------------------------------------------

var nums = [5, 3, 8, 1]                 // [Int]
let names: [String] = ["Ann", "Bo", "Cy"]
var empty: [Int] = []                   // an empty array needs its type written
let zeros = Array(repeating: 0, count: 5)

print(nums[0], nums[nums.count - 1])    // 5 1
print(nums.first as Any, nums.last as Any)   // Optional(5) Optional(1) — optional: array could be empty
print(nums.count, nums.isEmpty)         // 4 false
print(nums.contains(8))                 // true
print(nums.firstIndex(of: 8) as Any)    // Optional(2)
// print(nums[10])                      // 💥 crash: "Index out of range". Swift checks every index.


// --- 2. Changing arrays (only if declared with var) ---------------------------------------------

nums[0] = 50                    // [50, 3, 8, 1]
nums.append(9)                  // [50, 3, 8, 1, 9]
nums.insert(7, at: 0)           // [7, 50, 3, 8, 1, 9]
let last = nums.removeLast()    // removes & returns 9
let first = nums.remove(at: 0)  // removes & returns 7
nums.swapAt(0, 1)               // [3, 50, 8, 1]
print(nums, last, first)
nums += [100, 200]              // add several
empty.append(1)


// --- 3. Looping -------------------------------------------------------------------------------------

for name in names {
    print("Hi", name)
}
for i in 0..<names.count {                  // by index
    print(i, names[i])
}
for (i, name) in names.enumerated() {       // index AND value
    print(i, name)
}
for i in names.indices {                    // same as 0..<names.count
    print(i, terminator: " ")
}
print()


// --- 4. Handy built-ins --------------------------------------------------------------------------------

let scores = [70, 95, 82]
print(scores.max()!, scores.min()!)             // 95 70  (optional — empty arrays have no max)
print(scores.sorted())                          // [70, 82, 95] — a NEW sorted array
print(scores.sorted(by: >))                     // [95, 82, 70]
print(Array(scores.reversed()))                 // [82, 95, 70]
print(scores.reduce(0, +))                      // 247 — the sum (Lesson 10 explains reduce)

var toSort = [3, 1, 2]
toSort.sort()                                   // sorts IN PLACE (changes toSort itself)
print(toSort)


// --- 5. Slices -----------------------------------------------------------------------------------------

let letters = ["a", "b", "c", "d", "e"]
print(letters[1..<3])               // ["b", "c"]  — an ArraySlice
print(Array(letters[2...]))         // ["c", "d", "e"]  — wrap in Array(...) for a normal array
print(letters.prefix(2), letters.suffix(2))
print(letters.dropFirst())


// --- 6. Arrays are VALUES — copying makes a real copy -------------------------------------------------
//  (Unlike Python/Java, where both names would point at the same list.)

var a = [1, 2, 3]
var b = a           // b is a separate COPY
b.append(4)
print(a, b)         // [1, 2, 3] [1, 2, 3, 4]   ← a is unchanged!
a.append(0)


// --- 7. inout — letting a function change YOUR array ---------------------------------------------------
//  Function parameters are constants. To modify the caller's array, mark the
//  parameter inout and call with &.

func addOne(to values: inout [Int]) {
    for i in values.indices {
        values[i] += 1
    }
}
var data = [1, 2, 3]
addOne(to: &data)
print(data)         // [2, 3, 4]


// --- 8. 2D arrays — grids / matrices (CtCI 1.7 Rotate Matrix, 1.8 Zero Matrix) ------------------------

var grid = [
    [1, 2, 3],
    [4, 5, 6],
]
print(grid[1][2])                   // 6 → row 1, column 2
let rows = grid.count, cols = grid[0].count
for r in 0..<rows {
    for c in 0..<cols {
        print(grid[r][c], terminator: " ")
    }
    print()
}
grid[0][0] = 99
let blank = Array(repeating: Array(repeating: 0, count: 3), count: 2)   // 2 rows × 3 cols of 0
print(blank)


// --- 9. Two pointers — a key interview technique ------------------------------------------------------
//  One index at each end, moving toward the middle.

var word = Array("hello")
var left = 0, right = word.count - 1
while left < right {
    word.swapAt(left, right)
    left += 1
    right -= 1
}
print(String(word))                 // olleh
