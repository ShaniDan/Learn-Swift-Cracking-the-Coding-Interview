// =============================================================================
//  LESSON 06 — Loops
// =============================================================================


// --- 1. for-in over a range -------------------------------------------------------------------
//   0..<5    → 0 1 2 3 4        (half-open: stops BEFORE 5)  ← used most in interviews
//   1...5    → 1 2 3 4 5        (closed: includes 5)

for i in 0..<5 {
    print("i is", i)
}

for _ in 1...3 {                 // _ when you don't need the number
    print("hip hip hooray")
}

//  Counting by steps or backwards: stride
for n in stride(from: 0, to: 10, by: 3) { print(n, terminator: " ") }       // 0 3 6 9
print()
for n in stride(from: 5, through: 1, by: -1) { print(n, terminator: " ") }  // 5 4 3 2 1
print()
for n in (1...5).reversed() { print(n, terminator: " ") }                   // 5 4 3 2 1
print()

//  ⚠️ 0..<0 is fine (empty), but 5...1 CRASHES (a range can't go backwards).


// --- 2. for-in over a string ---------------------------------------------------------------------

for ch in "hey" {
    print(ch)
}

//  Need the index too? Use enumerated()  — gives (offset, element) pairs:
for (i, ch) in "abc".enumerated() {
    print(i, ch)
}


// --- 3. The accumulator pattern — THE most important loop pattern -------------------------------
//  Start a var before the loop, update it inside, use it after.

var total = 0
for n in 1...5 {
    total += n
}
print("1+2+3+4+5 =", total)           // 15

var countA = 0
for ch in "banana" where ch == "a" {  // `where` filters the loop
    countA += 1
}
print("a appears", countA, "times")   // 3

var backwards = ""
for ch in "hello" {
    backwards = String(ch) + backwards
}
print(backwards)                      // olleh


// --- 4. while and repeat-while ------------------------------------------------------------------

var number = 1234
var digitCount = 0
while number > 0 {
    number /= 10          // drop the last digit
    digitCount += 1
}
print("digits:", digitCount)          // 4

var tries = 0
repeat {                              // runs at least once, THEN checks
    tries += 1
} while tries < 3
print("tries:", tries)
//  ⚠️ If a while condition never becomes false, the program runs forever.
//     Press the ■ stop button (Cmd+.) in Xcode to stop it.


// --- 5. break and continue ------------------------------------------------------------------------

for n in 0..<10 {
    if n == 3 { continue }    // skip the rest of THIS round
    if n == 6 { break }       // leave the loop completely
    print(n, terminator: " ") // 0 1 2 4 5
}
print()


// --- 6. Returning from inside a loop -------------------------------------------------------------
//  Return false the moment you find a problem; return true after checking everything.

func allDigits(_ s: String) -> Bool {
    for ch in s {
        if !ch.isNumber {
            return false
        }
    }
    return true
}
print(allDigits("123"), allDigits("12a"))   // true false


// --- 7. Nested loops ------------------------------------------------------------------------------
//  A loop inside a loop: compare every pair, walk a grid. (Lesson 13: that's O(n²).)

for row in 0..<3 {
    var line = ""
    for col in 0..<3 {
        line += "(\(row),\(col)) "
    }
    print(line)
}

//  Comparing characters at positions i and j: turn the string into an array first.
let letters = Array("racecar")
print(letters[0] == letters[letters.count - 1])     // true
