// =============================================================================
//  LESSON 09 — Dictionaries and Sets (hash tables!)
// =============================================================================
//  📖 CtCI Chapter 1 opens with "Hash Tables" (PDF page 100). The book calls
//  it one of the most important structures for interviews: it looks things
//  up in O(1) time (Lesson 13 explains what that means).
//  In Swift, hash tables are built in: Dictionary and Set.
// =============================================================================


// --- 1. Dictionaries map KEYS to VALUES ------------------------------------------------------

var ages = ["Ann": 31, "Bo": 25]           // [String: Int]
ages["Cy"] = 40                             // add
ages["Bo"] = 26                             // update
ages["Ann"] = nil                           // remove
print(ages.count)                           // 2

//  Looking up a key gives an OPTIONAL — the key might not be there:
print(ages["Bo"] as Any)                    // Optional(26)
print(ages["Zed"] as Any)                   // nil
print(ages["Zed"] ?? 0)                     // 0
print(ages["Zed", default: 0])              // 0 — same idea, dictionary style
if let boAge = ages["Bo"] {
    print("Bo is", boAge)
}
print(ages.keys.contains("Cy"))             // true


// --- 2. Looping ----------------------------------------------------------------------------------
//  ⚠️ Dictionaries have NO order. Sort the keys if you need a predictable order.

for (name, age) in ages {
    print(name, age)
}
for name in ages.keys.sorted() {
    print(name, ages[name]!)
}


// --- 3. THE pattern: counting with a dictionary ---------------------------------------------------
//  You'll use this in CtCI 1.2, 1.4, 10.2 and many more.

var counts: [Character: Int] = [:]          // empty dictionary
for ch in "banana" {
    counts[ch, default: 0] += 1             // "default: 0" = start at 0 if missing
}
print(counts)                               // ["b": 1, "a": 3, "n": 2] (any order)


// --- 4. Grouping with a dictionary of arrays --------------------------------------------------------

let fruits = ["apple", "avocado", "banana", "blueberry", "cherry"]
var byLetter: [Character: [String]] = [:]
for fruit in fruits {
    byLetter[fruit.first!, default: []].append(fruit)
}
print(byLetter)
//  Swift shortcut:  Dictionary(grouping: fruits) { $0.first! }


// --- 5. Sets: unique items, fast "is it in here?" ---------------------------------------------------

var seen = Set<Int>()                       // empty set
seen.insert(3)
seen.insert(5)
seen.insert(3)                              // already there — nothing happens
print(seen.count)                           // 2
print(seen.contains(5))                     // true — O(1), much faster than an array's contains
seen.remove(5)

let unique = Set([1, 2, 2, 3, 3, 3])        // {1, 2, 3} — dropping duplicates
print(unique.count)
let x: Set = [1, 2, 3], y: Set = [2, 3, 4]
print(x.intersection(y).sorted())           // [2, 3]
print(x.union(y).sorted())                  // [1, 2, 3, 4]
print(x.subtracting(y).sorted())            // [1]

//  insert tells you whether it was new — handy for "seen before?" checks:
var visited = Set<String>()
print(visited.insert("A").inserted)         // true  (new)
print(visited.insert("A").inserted)         // false (already there)


// --- 6. The "seen" pattern ---------------------------------------------------------------------------

func containsDuplicate(_ items: [Int]) -> Bool {
    var seenSoFar = Set<Int>()
    for item in items {
        if seenSoFar.contains(item) { return true }
        seenSoFar.insert(item)
    }
    return false
}
print(containsDuplicate([1, 2, 3, 2]))      // true


// --- 7. What can be a key? ----------------------------------------------------------------------------
//  Anything "Hashable": Int, String, Character, Bool, Double... and your own
//  structs if you add ": Hashable" (Lesson 11). Arrays of Hashable things too.
