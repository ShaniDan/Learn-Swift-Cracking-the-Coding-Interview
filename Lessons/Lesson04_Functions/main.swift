// =============================================================================
//  LESSON 04 — Functions
// =============================================================================
//  In interviews you're almost always asked to "write a function that...".
// =============================================================================


// --- 1. Defining and calling a function ---------------------------------------------------
//
//   func name(parameter: Type) -> ReturnType {
//       body
//       return result
//   }

func square(number: Int) -> Int {
    return number * number
}

print(square(number: 4))        // 16 — you write the parameter's LABEL when calling
let nine = square(number: 3)    // the returned value can be stored
print(nine + 1)                 // 10


// --- 2. Argument labels: Swift's special feature ---------------------------------------------
//  A parameter can have an outside name (used when calling) and an inside
//  name (used in the body). Use _ to have NO outside name.

func greet(person name: String) -> String {     // outside: person, inside: name
    return "Hello, \(name)!"
}
print(greet(person: "Sam"))

func double(_ n: Int) -> Int {                  // _ = no label when calling
    return n * 2
}
print(double(21))                               // 42 — reads naturally

func area(width: Int, height: Int) -> Int {
    return width * height
}
print(area(width: 3, height: 5))                // 15


// --- 3. Default values --------------------------------------------------------------------------

func welcome(_ name: String, greeting: String = "Hello") -> String {
    return "\(greeting), \(name)!"
}
print(welcome("Sam"))                       // Hello, Sam!
print(welcome("Sam", greeting: "Hi"))       // Hi, Sam!


// --- 4. One-line functions can skip the word return ----------------------------------------

func triple(_ n: Int) -> Int { n * 3 }
print(triple(5))                            // 15


// --- 5. Functions that return nothing ---------------------------------------------------------

func sayHi() {                              // no "-> Type" means it returns nothing
    print("hi!")
}
sayHi()


// --- 6. return vs print — the classic beginner mix-up ------------------------------------------
//  print() only SHOWS a value in the console. return GIVES the value back so
//  the rest of your program (and the checks!) can use it.
//  Swift helps you here: if a function says "-> Int", you MUST return an Int,
//  or Xcode shows an error.


// --- 7. Parameters are constants -------------------------------------------------------------
//  Inside a function you can't change a parameter. Copy it into a var:

func countdown(from start: Int) -> String {
    var n = start             // a local copy we can change
    var result = ""
    while n > 0 {             // (loops are Lesson 06)
        result += "\(n) "
        n -= 1
    }
    return result + "liftoff!"
}
print(countdown(from: 3))     // 3 2 1 liftoff!


// --- 8. Documentation comments ---------------------------------------------------------------
//  A comment starting with /// documents the function. Option-click a
//  function's name in Xcode to see it in a popup. Try it on  hypotenuse  below!

/// Returns the length of the long side of a right triangle.
func hypotenuse(_ a: Double, _ b: Double) -> Double {
    return (a * a + b * b).squareRoot()
}
print(hypotenuse(3, 4))       // 5.0
