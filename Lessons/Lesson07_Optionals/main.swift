// =============================================================================
//  LESSON 07 — Optionals: values that might be missing
// =============================================================================
//  This is THE Swift idea that other languages don't have. You'll use it in
//  every linked list and tree problem (a node's "next" might be missing).
// =============================================================================


// --- 1. What is an optional? -----------------------------------------------------------------
//  Int   = definitely an Int.
//  Int?  = an Int OR nothing (nil). The ? makes it optional.

var middleName: String? = nil        // no middle name yet
print(middleName as Any)             // nil
middleName = "Grace"
print(middleName as Any)             // Optional("Grace")

//  Many things in Swift return optionals because they can fail:
let maybeNumber = Int("42")          // Int?  → Optional(42)
let notNumber = Int("hello")         // Int?  → nil
let firstLetter = "swift".first      // Character?  (an empty string has no first)
print(maybeNumber as Any, notNumber as Any, firstLetter as Any)

//  You CAN'T use an optional directly as if it were a normal value:
//  let doubled = maybeNumber * 2     // ❌ error: value of optional type 'Int?' must be unwrapped


// --- 2. Unwrapping with  if let  ----------------------------------------------------------------
//  "If there's a value inside, give it a name and run this block."

if let number = Int("42") {
    print("Got a number:", number * 2)      // 84 — number is a plain Int here
} else {
    print("That wasn't a number")
}

if let middleName {                          // short form: same name
    print("Middle name is", middleName)
}


// --- 3. guard let — unwrap or leave early --------------------------------------------------------
//  Very common at the top of functions. After the guard, the value is
//  available for the rest of the function.

func greetUser(_ name: String?) -> String {
    guard let name else {
        return "Hello, stranger!"
    }
    return "Hello, \(name)!"                 // name is a plain String now
}
print(greetUser(nil), greetUser("Sam"))


// --- 4. ?? — "or use this default" ----------------------------------------------------------------

let age = Int("abc") ?? 0
print(age)                                   // 0
let nickname: String? = nil
print(nickname ?? "no nickname")


// --- 5. Optional chaining with ?. -------------------------------------------------------------------
//  Call something on an optional; if it's nil, the whole thing is nil.

let maybeWord: String? = "hello"
print(maybeWord?.uppercased() as Any)        // Optional("HELLO")
print(maybeWord?.count ?? 0)                 // 5
let noWord: String? = nil
print(noWord?.count ?? 0)                    // 0


// --- 6. Force unwrapping with ! — only when you're 100% sure -------------------------------------
//  ! says "I promise there's a value". If there isn't, the app CRASHES:
//  "Fatal error: Unexpectedly found nil while unwrapping an Optional value"

let sure = Int("7")!                         // safe: "7" is definitely a number
print(sure)
// let boom = Int("x")!                      // 💥 crash. Uncomment to see it once.


// --- 7. Returning optionals from your own functions -----------------------------------------------
//  Return nil to say "there's no answer".

func indexOfFirstSpace(_ s: String) -> Int? {
    for (i, ch) in s.enumerated() where ch == " " {
        return i
    }
    return nil
}
print(indexOfFirstSpace("hi there") as Any)  // Optional(2)
print(indexOfFirstSpace("hello") as Any)     // nil


// --- 8. Optionals compare nicely ------------------------------------------------------------------

let found: Int? = 5
print(found == 5)          // true — you can compare an optional to a value directly
print(found == nil)        // false
