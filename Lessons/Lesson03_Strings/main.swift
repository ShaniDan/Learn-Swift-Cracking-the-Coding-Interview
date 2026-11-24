// =============================================================================
//  LESSON 03 — Strings and Characters
// =============================================================================
//  Half of CtCI Chapter 1 is string problems, so this lesson matters.
//  ⚠️ Swift strings work DIFFERENTLY from most languages — read carefully.
// =============================================================================


// --- 1. Strings and Characters --------------------------------------------------------------

let word = "swift"                  // String = text
let letter: Character = "s"         // Character = ONE character (also double quotes!)
print(word.count)                   // 5 — number of characters
print(word.isEmpty)                 // false
let multiLine = """
    Triple quotes
    span several lines
    """
print(multiLine)


// --- 2. ⚠️ You CAN'T write word[0] in Swift ---------------------------------------------------
//  Swift strings handle emoji and every language correctly ("é", "👩‍💻" are
//  ONE character each), so characters have different sizes and Swift won't
//  let you jump to position 3 directly.
//
//  print(word[0])        // ❌ error: cannot subscript String with an Int
//
//  The interview trick: turn the string into an ARRAY of characters once.
//  Arrays CAN be indexed with numbers (counting starts at 0):

let chars = Array(word)             // ["s", "w", "i", "f", "t"]
print(chars[0])                     // s
print(chars[chars.count - 1])       // t  (the last one)
print(word.first!, word.last!)      // s t   (the ! is explained in Lesson 07)


// --- 3. Pieces of a string ---------------------------------------------------------------------

let book = "Cracking the Coding Interview"
print(book.prefix(8))               // Cracking    (first 8 characters)
print(book.suffix(9))               // Interview   (last 9)
print(String(book.reversed()))      // weivretnI gnidoC eht gnikcarC
print(book.lowercased())            // cracking the coding interview
print(book.uppercased())
print(book.contains("Coding"))      // true
print(book.hasPrefix("Crack"), book.hasSuffix("view"))    // true true

//  prefix() gives a "Substring" (a view into the original). Wrap it in
//  String(...) when you want a normal String:
let firstWordOfBook = String(book.prefix(8))
print(firstWordOfBook)


// --- 4. Splitting, joining, replacing ---------------------------------------------------------

let parts = book.split(separator: " ")          // ["Cracking", "the", "Coding", "Interview"]
print(parts.count)                              // 4
let wordList = parts.map { String($0) }            // turn each Substring into a String (Lesson 10)
print(wordList.joined(separator: "-"))             // Cracking-the-Coding-Interview
print(book.replacing(" ", with: "%20"))         // Cracking%20the%20Coding%20Interview


// --- 5. Building strings -------------------------------------------------------------------------

var greeting = "Hello"
greeting += ", "                    // add text to a var string
greeting.append("World")
greeting.append(Character("!"))
print(greeting)                     // Hello, World!
print("ha" + "ha")                  // haha
print(String(repeating: "ab", count: 3))    // ababab


// --- 6. Characters are numbers underneath --------------------------------------------------------
//  Every basic Latin character has an ASCII code. Used in CtCI 1.1 and 1.4.

let a: Character = "a"
let c: Character = "c"
print(a.asciiValue!)                        // 97
print(c.asciiValue! - a.asciiValue!)        // 2  → "c" is letter #2 counting from 0
print(Character("A").isUppercase, Character("7").isNumber, Character(" ").isWhitespace)
print(Character("B").lowercased())          // "b"  (gives a String)


// --- 7. Counting with a filter (a sneak peek at closures, Lesson 10) ----------------------------

let countO = book.filter { $0 == "o" }.count     // keep only the "o" characters, count them
print(countO)                                     // 1  (case-sensitive!)
