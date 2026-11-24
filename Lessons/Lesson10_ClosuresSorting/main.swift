// =============================================================================
//  LESSON 10 — Tuples, closures, map/filter/reduce, and sorting
// =============================================================================
//  Small tools that make interview code short and clear.
// =============================================================================


// --- 1. Tuples: a few values grouped together -----------------------------------------------

let point = (3, 4)
print(point.0, point.1)                 // 3 4
let person = (name: "Ann", age: 31)     // named parts
print(person.name, person.age)

let (px, py) = point                    // unpack ("destructure")
print(px + py)

var a = 1, b = 2
(a, b) = (b, a)                         // swap in one line
print(a, b)                             // 2 1

func minAndMax(_ nums: [Int]) -> (min: Int, max: Int) {
    return (nums.min()!, nums.max()!)   // return several values at once
}
let result = minAndMax([4, 1, 9])
print(result.min, result.max)           // 1 9


// --- 2. Closures: functions without a name ---------------------------------------------------
//  A closure is a block of code you can pass around, like a value.

let double = { (n: Int) -> Int in
    return n * 2
}
print(double(21))                       // 42

//  Swift lets you shorten closures a LOT when it can guess the types:
//    { (n: Int) -> Int in return n * 2 }
//    { n in n * 2 }
//    { $0 * 2 }                         ← $0 = first argument, $1 = second


// --- 3. map, filter, reduce — loops in one line --------------------------------------------

let nums = [1, 2, 3, 4, 5]
print(nums.map { $0 * $0 })             // [1, 4, 9, 16, 25]      transform each item
print(nums.filter { $0 % 2 == 0 })      // [2, 4]                 keep matching items
print(nums.reduce(0, +))                // 15                     combine into one value
print(nums.reduce(1) { $0 * $1 })       // 120                    (running product)
print(nums.contains { $0 > 4 })         // true
print(nums.allSatisfy { $0 > 0 })       // true
print(nums.first { $0 > 2 } as Any)     // Optional(3)
print(["1", "x", "3"].compactMap { Int($0) })   // [1, 3] — map, dropping the nils

//  When a closure is the last argument, it goes after the ( ) — "trailing closure".


// --- 4. zip — walk two arrays side by side --------------------------------------------------

let names = ["Ann", "Bo"]
let scores = [90, 85]
for (name, score) in zip(names, scores) {
    print(name, score)
}
let table = Dictionary(uniqueKeysWithValues: zip(names, scores))
print(table)                            // ["Ann": 90, "Bo": 85]


// --- 5. Sorting with your own rule -----------------------------------------------------------
//  sorted(by:) takes a closure that answers: "should $0 come before $1?"

let words = ["banana", "Kiwi", "apple", "fig"]
print(words.sorted())                                   // uppercase letters sort first!
print(words.sorted { $0.lowercased() < $1.lowercased() })   // case-insensitive
print(words.sorted { $0.count < $1.count })             // by length
print(words.sorted(by: >))                              // reverse order

let people = [(name: "Ann", age: 31), (name: "Bo", age: 25), (name: "Cy", age: 31)]
let byAgeThenName = people.sorted {
    if $0.age != $1.age { return $0.age > $1.age }      // older first
    return $0.name < $1.name                            // then A→Z
}
print(byAgeThenName.map { $0.name })                    // ["Ann", "Cy", "Bo"]
print(people.max { $0.age < $1.age }!.name)             // max/min take a rule too


// --- 6. The anagram trick ---------------------------------------------------------------------
//  Two words are anagrams if their sorted letters match. (CtCI 1.2, 10.2)

print(String("listen".sorted()))                        // eilnst
print("listen".sorted() == "silent".sorted())           // true
