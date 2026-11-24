// =============================================================================
//  LESSON 14 — CtCI Chapter 1: Arrays and Strings
// =============================================================================
//  📖 READ FIRST:   Chapter 1 intro + questions     PDF page 100
//  💡 HINTS:        PDF page 664  (try a hint before the solution!)
//  ✅ SOLUTIONS:    PDF page 204  (book code is Java — copy the IDEAS)
//
//  Java (book)                         →  Swift
//  ----------------------------------------------------------------------
//  int[] a = new int[n]                →  var a = Array(repeating: 0, count: n)
//  s.charAt(i)                         →  let chars = Array(s); chars[i]
//  char[] chars = s.toCharArray()      →  var chars = Array(s)
//  new String(chars)                   →  String(chars)
//  StringBuilder sb; sb.append(x)      →  var out = ""; out.append(x)   (or [String] + joined())
//  HashMap<Character, Integer>         →  [Character: Int]
//  HashSet<Character>                  →  Set<Character>
//  boolean[128] (ASCII table)          →  Array(repeating: false, count: 128) with Int(ch.asciiValue!)
//  s.length()                          →  s.count   (⚠️ O(n) in Swift — store it in a let)
//
//  HOW TO WORK EACH PROBLEM (the book's method, Chapter VII, PDF page 72):
//    1. Listen       — reread the problem; note every detail.
//    2. Example      — make a big-ish example, not a special case.
//    3. Brute force  — say the slow way first, and its Big O.
//    4. Optimize     — look for BUD (Lesson 13). Would a Set/Dictionary help?
//    5. Walk through — trace your idea on the example BEFORE coding.
//    6. Implement    — write clean code.
//    7. Test         — small cases + edge cases (empty, 1 char, all the same).
// =============================================================================


// --- Technique 1: counting characters with a fixed-size array (the "Java" way) -----------------

func letterCounts(_ s: String) -> [Int] {
    var counts = Array(repeating: 0, count: 26)         // one slot per letter a...z
    let a = Int(Character("a").asciiValue!)
    for ch in s {
        counts[Int(ch.asciiValue!) - a] += 1
    }
    return counts
}
print(Array(letterCounts("abca").prefix(3)))            // [2, 1, 1]


// --- Technique 2: work on an Array of characters, then turn it back into a String -------------

var chars = Array("hello")
chars[0] = "j"
print(String(chars))                                    // jello


// --- Technique 3: compare neighbors ------------------------------------------------------------

let sortedChars = "banana".sorted()                     // ["a","a","a","b","n","n"]
for i in 1..<sortedChars.count where sortedChars[i] == sortedChars[i - 1] {
    print("duplicate:", sortedChars[i])
}

print("\nOpen Exercises.swift — these are the book's Chapter 1 problems. 💪")
