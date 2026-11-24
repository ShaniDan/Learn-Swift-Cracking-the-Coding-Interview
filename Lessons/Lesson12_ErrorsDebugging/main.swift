// =============================================================================
//  LESSON 12 — Errors and debugging in Xcode
// =============================================================================
//  Everyone's code breaks. Good programmers are good at FIXING it fast.
// =============================================================================


// --- 1. Three kinds of problems ------------------------------------------------------------------
//
//  1. COMPILE ERRORS (red ⛔ in Xcode, before running). Swift catches lots of
//     mistakes early: wrong types, missing return, typos. Click the red icon
//     to read the message — Xcode often offers a "Fix" button.
//
//  2. CRASHES (the app stops while running). Xcode jumps to the line and
//     shows a message in the console, e.g.
//        Fatal error: Index out of range
//        Fatal error: Unexpectedly found nil while unwrapping an Optional value
//     Common causes: array[i] with a bad i, force-unwrapping nil with !,
//     dividing an Int by zero, a range like 5...1.
//
//  3. WRONG ANSWERS (no error, just the wrong result). These are found with
//     tests (Cmd+U) and the debugger.


// --- 2. Throwing errors: saying "this failed" ----------------------------------------------------
//  Define the possible errors as an enum that conforms to Error:

enum PasswordError: Error {
    case tooShort
    case noNumber
}

func checkPassword(_ password: String) throws -> String {   // "throws" = might fail
    if password.count < 8 {
        throw PasswordError.tooShort
    }
    if !password.contains(where: { $0.isNumber }) {
        throw PasswordError.noNumber
    }
    return "Strong enough"
}


// --- 3. Calling a throwing function: do / try / catch ------------------------------------------------

do {
    let verdict = try checkPassword("abc")       // "try" is required before a throwing call
    print(verdict)
} catch PasswordError.tooShort {
    print("Too short!")
} catch {
    print("Other problem:", error)               // `error` exists automatically in a catch
}

//  try?  turns an error into nil (an optional):
let maybe = try? checkPassword("longpassword1")
print(maybe as Any)                              // Optional("Strong enough")
let nope = try? checkPassword("short")
print(nope as Any)                               // nil


// --- 4. guard for checking inputs ------------------------------------------------------------------------

func average(_ nums: [Double]) -> Double? {
    guard !nums.isEmpty else { return nil }      // handle the bad case first
    return nums.reduce(0, +) / Double(nums.count)
}
print(average([]) as Any, average([1, 2, 3, 4]) as Any)


// --- 5. assert / precondition: self-checks -------------------------------------------------------------

assert(average([2, 4]) == 3, "average is broken")   // stops (in debug builds) if false
//  The book (Chapter VII "Technical Questions", PDF page 72) says: always
//  TEST your code — small examples, then edge cases (empty input, one item,
//  negative numbers, duplicates).


// --- 6. Using the Xcode DEBUGGER — do this once, it's a superpower ---------------------------------------
//
//  1. Click on the LINE NUMBER of the line marked "← BREAKPOINT" below.
//     A blue arrow appears — that's a breakpoint.
//  2. Press Cmd+R. The program PAUSES at that line.
//  3. Look at the bottom-left panel: every variable's current value.
//  4. Use the buttons above the console:
//       ⏭ Step Over (F6)   — run one line
//       ⬇ Step Into (F7)   — go inside a function call
//       ▶ Continue  (Ctrl+Cmd+Y) — run until the next breakpoint
//  5. In the console you can type   po total   to print a variable.
//  6. Click the blue arrow again to disable it; drag it away to delete it.

func sumOfSquares(_ n: Int) -> Int {
    var total = 0
    for i in 1...n {
        total += i * i              // ← BREAKPOINT: click this line's number
    }
    return total
}
print("sum of squares:", sumOfSquares(4))   // 30

//  The old-school way works too: add print("DEBUG i=\(i) total=\(total)")

//  Debugging a FAILING TEST: put a breakpoint inside your function in
//  Exercises.swift, then press Cmd+U — Xcode pauses there during the test.
