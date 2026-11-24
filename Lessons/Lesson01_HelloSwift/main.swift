// =============================================================================
//  LESSON 01 — Hello, Swift!
// =============================================================================
//
//  HOW EVERY LESSON WORKS
//  ----------------------
//  Each lesson folder has two files:
//     main.swift       ← YOU ARE HERE. Explanations + examples you can run.
//     Exercises.swift  ← your homework. Fill in the functions there.
//
//  1. Read this file. Lines starting with // are COMMENTS — Swift ignores them.
//  2. RUN IT: at the top of Xcode, click the scheme menu (next to the ▶ button)
//     and choose "Lesson01_HelloSwift". Then press Cmd+R (or click ▶).
//     The output appears in the DEBUG AREA at the bottom (Cmd+Shift+Y shows it).
//  3. Open Exercises.swift (same folder) and do the exercises.
//  4. CHECK: press Cmd+U. Then open the Test navigator (Cmd+6):
//        ✅ green = correct   ❌ red = wrong (click it to see why)   ⏭ grey = not started
//
//  Experiment! Change the examples, break them, run again. Xcode shows errors
//  in red right next to the line — read them, they're usually helpful.
// =============================================================================


// --- 1. print() shows things in the console -----------------------------------------

print("Hello, world!")
print("My first Swift program.")
print(2 + 3)            // Swift can do math: prints 5
print("2 + 3")          // ...but inside quotes it's just text: prints 2 + 3


// --- 2. Constants (let) and variables (var) ---------------------------------------------
//
//  let  = a CONSTANT. Once set, it can never change.  (Use this by default.)
//  var  = a VARIABLE. You can change it later.

let city = "Tashkent"
var year = 2026
print(city)
print(year)

year = year + 1         // allowed: year is a var
print(year)             // 2027
// city = "London"      // ❌ error: can't change a let. Uncomment it to see Xcode complain.

//  Naming: Swift uses camelCase — firstName, totalPrice, maxScore.


// --- 3. Every value has a TYPE -------------------------------------------------------------
//
//  Swift figures out the type for you ("type inference"):
let language = "Swift"      // String  (text)
let lessons = 21            // Int     (whole number)
let pi = 3.14159            // Double  (decimal number)
let isFun = true            // Bool    (true or false)

//  You can also write the type yourself:
let score: Int = 100
let name: String = "Ada"

//  A variable's type never changes:
//  var count = 5
//  count = "five"          // ❌ error: can't put a String into an Int variable


// --- 4. String interpolation: put values inside text with \( ) ------------------------------

print("\(name) is learning \(language). There are \(lessons) lessons.")
print("Score: \(score), pi is about \(pi), fun? \(isFun)")
print("2 + 3 = \(2 + 3)")       // you can even do math inside \( )


// --- 5. Reading input (optional experiment) ------------------------------------------------
//  readLine() reads a line typed into the console. Uncomment, run, and type
//  your name in the debug area at the bottom:
//
//  print("What is your name?")
//  if let typed = readLine() {
//      print("Nice to meet you, \(typed)!")
//  }
//  (The "if let" part is explained in Lesson 07.)

print("\nNow open Exercises.swift in this folder. 👉")
