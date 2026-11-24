// =============================================================================
//  LESSON 05 — Making decisions: if, else, switch
// =============================================================================


// --- 1. if / else if / else ---------------------------------------------------------------

let temperature = 30
if temperature > 25 {
    print("It's hot")
} else if temperature > 15 {
    print("It's nice")
} else {
    print("It's cold")
}
//  Swift needs the { } braces, but NOT parentheses around the condition.


// --- 2. Comparison and logic operators ------------------------------------------------------
//   ==  !=  <  <=  >  >=
//   &&  AND — both must be true
//   ||  OR  — at least one is true
//   !   NOT — flips true/false

let age = 20
let hasTicket = true
if age >= 18 && hasTicket {
    print("Welcome in")
}
if !(age < 18) {
    print("Not a minor")
}


// --- 3. The ternary operator: a tiny if/else that produces a value -------------------------

let label = age >= 18 ? "adult" : "minor"
print(label)


// --- 4. if as an expression (Swift 5.9+) ---------------------------------------------------

let size = if temperature > 25 { "big fan" } else { "no fan" }
print(size)


// --- 5. switch — Swift's super-powered choice ---------------------------------------------
//  Every possible value must be handled (that's what `default` is for).
//  No "break" needed — Swift never falls through to the next case.

func describe(_ n: Int) -> String {
    switch n {
    case 0:
        return "zero"
    case 1, 2, 3:                       // several values
        return "small"
    case 4...9:                         // a range (4 through 9)
        return "medium"
    case let x where x < 0:             // a condition
        return "negative"
    default:
        return "big"
    }
}
print(describe(0), describe(2), describe(7), describe(-5), describe(100))

let ch: Character = "e"
switch ch {
case "a", "e", "i", "o", "u":
    print("\(ch) is a vowel")
default:
    print("\(ch) is a consonant")
}


// --- 6. Returning a condition directly ------------------------------------------------------
//  Beginners write:                 Pros write:
//      if n > 0 {                       return n > 0
//          return true
//      } else {
//          return false
//      }


// --- 7. Returning early ---------------------------------------------------------------------
//  Handle special cases first and return — keeps the rest flat and readable.

func safeDivide(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return 0
    }
    return a / b
}
print(safeDivide(10, 0))
