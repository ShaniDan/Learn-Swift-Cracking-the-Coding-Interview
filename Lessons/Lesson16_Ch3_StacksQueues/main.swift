// =============================================================================
//  LESSON 16 — CtCI Chapter 3: Stacks and Queues
// =============================================================================
//  📖 READ FIRST:   Chapter 3 intro + questions     PDF page 108
//  ✅ SOLUTIONS:    PDF page 239
//
//  STACK = LIFO (Last In, First Out) — a stack of plates.
//      push(x) puts on top, pop() takes from the top, peek() looks at the top.
//  QUEUE = FIFO (First In, First Out) — a line at a shop.
//      enqueue(x) joins at the back, dequeue() takes from the front.
// =============================================================================


// --- 1. A Swift Array IS a great stack ---------------------------------------------------------

var stack: [Int] = []
stack.append(1)            // push
stack.append(2)
stack.append(3)
print(stack.last as Any)   // peek → Optional(3)
print(stack.popLast() as Any)  // pop → Optional(3)  (nil if empty — safe!)
print(stack.removeLast())  // pop → 2  (CRASHES if empty — only use when sure)
print(stack.isEmpty)       // false


// --- 2. Queues ---------------------------------------------------------------------------------------
//  array.removeFirst() is O(n) — it shifts everything (Lesson 13). Swift has
//  no built-in fast queue, so a common trick is an array + a "head" index:

struct SimpleQueue {
    private var items: [String] = []
    private var head = 0

    mutating func enqueue(_ item: String) { items.append(item) }

    mutating func dequeue() -> String? {
        guard head < items.count else { return nil }
        let item = items[head]
        head += 1                          // O(1): don't remove, just move the head
        return item
    }

    var isEmpty: Bool { head >= items.count }
}

var line = SimpleQueue()
line.enqueue("Ann")
line.enqueue("Bo")
print(line.dequeue() as Any, line.dequeue() as Any, line.dequeue() as Any)   // Ann Bo nil
//  (3.4 shows another classic way: a queue built from TWO stacks.)


// --- 3. Generics: one Stack for ANY type -----------------------------------------------------------
//  <Element> is a placeholder type. Stack<Int>, Stack<String>... all from one definition.

struct Box<Element> {
    var value: Element
}
let intBox = Box(value: 42)            // Box<Int>
let textBox = Box(value: "hi")         // Box<String>
print(intBox.value, textBox.value)


// --- 4. Where stacks and queues show up --------------------------------------------------------------
//   Stacks: undo, the back button, matching brackets, depth-first search,
//           turning recursion into a loop.
//   Queues: breadth-first search (Lesson 17), task scheduling, buffering.
