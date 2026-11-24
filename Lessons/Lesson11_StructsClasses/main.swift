// =============================================================================
//  LESSON 11 — Structs, classes and enums
// =============================================================================
//  Linked lists, stacks, queues and trees (CtCI chapters 2–4) are built from
//  small classes. The book's "Code Library" (PDF page 657) shows Java
//  versions — here's the Swift way.
// =============================================================================


// --- 1. struct: a custom type that groups data + behavior ---------------------------------

struct Point {
    var x: Int                          // properties
    var y: Int

    func distanceFromOrigin() -> Int {  // a method
        return abs(x) + abs(y)
    }

    mutating func moveRight(by steps: Int) {    // a method that CHANGES the struct
        x += steps                              // needs the word "mutating"
    }
}

var p = Point(x: 3, y: -4)          // structs get a free initializer
print(p.x, p.distanceFromOrigin())  // 3 7
p.moveRight(by: 2)
print(p)                            // Point(x: 5, y: -4)


// --- 2. class: like a struct, but SHARED (a "reference type") ----------------------------------

class Dog {
    let name: String
    var age: Int

    init(name: String, age: Int) {  // classes need you to write init
        self.name = name            // self.name = the property; name = the parameter
        self.age = age
    }

    func bark() -> String {
        return "\(name) says woof!"
    }

    func haveBirthday() {           // no "mutating" needed in classes
        age += 1
    }
}

let rex = Dog(name: "Rex", age: 3)
print(rex.bark())
rex.haveBirthday()
print(rex.age)                      // 4


// --- 3. ⭐ THE big difference: copy vs share -----------------------------------------------------

var p1 = Point(x: 0, y: 0)
var p2 = p1                         // struct → p2 is a COPY
p2.x = 100
print(p1.x, p2.x)                   // 0 100   ← p1 unchanged

let d1 = Dog(name: "Fido", age: 1)
let d2 = d1                         // class → d2 is the SAME dog
d2.haveBirthday()
print(d1.age, d2.age)               // 2 2     ← both changed!
print(d1 === d2)                    // true    — === asks "is this the very same object?"

//  Rule of thumb: use struct by default. Use class when things need to be
//  SHARED or point at each other — like nodes in a linked list or tree.


// --- 4. Objects pointing to other objects  ← the key idea for Lessons 15–17 ---------------------

class Node {
    var data: Int
    var next: Node?                 // the next node — or nil at the end

    init(_ data: Int, next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

let third = Node(3)
let second = Node(2, next: third)
let head = Node(1, next: second)    // 1 → 2 → 3 → nil

var current: Node? = head
while let node = current {          // walk the chain until nil
    print(node.data, terminator: " → ")
    current = node.next
}
print("nil")
//  That's a linked list! Lesson 15 is all about it.


// --- 5. enum: one of a fixed set of choices ---------------------------------------------------

enum Direction {
    case north, south, east, west

    var opposite: Direction {       // a "computed property"
        switch self {
        case .north: return .south
        case .south: return .north
        case .east: return .west
        case .west: return .east
        }
    }
}

let heading = Direction.north
print(heading, heading.opposite)    // north south


// --- 6. Protocols (briefly): promises a type makes -------------------------------------------
//  ": Equatable" = can be compared with ==. ": Hashable" = can go in a Set or
//  be a dictionary key. ": CustomStringConvertible" = controls how it prints.

struct Card: Equatable, Hashable, CustomStringConvertible {
    let rank: String
    let suit: String
    var description: String { "\(rank)\(suit)" }
}
let ace = Card(rank: "A", suit: "♠")
print(ace, ace == Card(rank: "A", suit: "♠"))   // A♠ true
let hand: Set = [ace, Card(rank: "K", suit: "♥")]
print(hand.count)
