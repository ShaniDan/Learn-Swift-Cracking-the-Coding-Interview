// =============================================================================
//  LESSON 02 — Numbers, math and types
// =============================================================================
//  Choose the "Lesson02_Numbers" scheme and press Cmd+R. Compare each printed
//  line with the comment next to it.
// =============================================================================


// --- 1. Int and Double ----------------------------------------------------------------------
//  Int    = whole numbers:   7, -3, 0, 1_000_000  (underscores are just for reading)
//  Double = decimal numbers: 3.14, -0.5, 2.0

let whole = 7
let decimal = 7.0
print(type(of: whole), type(of: decimal))     // Int Double


// --- 2. Arithmetic operators ----------------------------------------------------------------

print(7 + 2)        // 9
print(7 - 2)        // 5
print(7 * 2)        // 14
print(7 / 2)        // 3     ⚠️ Int / Int = Int — the decimal part is THROWN AWAY
print(7.0 / 2.0)    // 3.5   Double / Double = Double
print(7 % 2)        // 1     remainder ("modulo")

//  % and / are used CONSTANTLY in interview problems:
//    n % 2 == 0     → n is even
//    n % 10         → last digit        (1234 % 10 == 4)
//    n / 10         → drop last digit   (1234 / 10 == 123)
print(1234 % 10, 1234 / 10)                 // 4 123

//  Swift has no ** power operator for Int. For powers of 2 use a bit shift:
print(1 << 10)      // 1024 = 2 to the 10th  (Lesson 18 explains why)


// --- 3. Swift NEVER mixes types automatically -----------------------------------------------

let apples = 3
let pricePerApple = 0.5
// let total = apples * pricePerApple        // ❌ error: Int * Double
let total = Double(apples) * pricePerApple   // ✅ convert first
print(total)                                 // 1.5

print(Int(3.99))    // 3   Int() chops off the decimals
print(Double(5))    // 5.0
print(String(42) + "!")   // "42!"

//  Converting TEXT to a number might fail ("hello" isn't a number), so
//  Int("42") gives an "optional" — an Int that might be missing (Lesson 07).
//  For now, the  ?? 0  part means "or 0 if it failed":
let parsed = Int("42") ?? 0
print(parsed + 1)   // 43


// --- 4. Useful functions -----------------------------------------------------------------------

print(abs(-5))              // 5
print(max(3, 9, 4))         // 9
print(min(3, 9, 4))         // 3
print(10.isMultiple(of: 5)) // true
print(Int.max)              // 9223372036854775807 — the biggest Int


// --- 5. Shortcut operators -----------------------------------------------------------------------

var points = 10
points += 5         // points = points + 5
points *= 2         // points = points * 2
points -= 1
print(points)       // 29
//  Swift has NO ++ or -- (use += 1 and -= 1).


// --- 6. Booleans and comparisons ------------------------------------------------------------------

print(5 > 3)        // true
print(5 == 3)       // false   (== compares; = assigns!)
print(5 != 3)       // true
print(10 % 2 == 0)  // true
