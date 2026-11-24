import Testing
import Support
@testable import Lesson07_Optionals

@Suite("Lesson 07 · Optionals")
struct Lesson07Checks {
    @Test("1. parseInt", .disabled(if: Todo.notStarted { _ = parseInt("1") }, "⏭ not started"))
    func check_parseInt() {
        #expect(parseInt("42") == 42)
        #expect(parseInt("hi") == 0)
        #expect(parseInt("-7") == -7)
    }

    @Test("2. safeDivide", .disabled(if: Todo.notStarted { _ = safeDivide(1, 1) }, "⏭ not started"))
    func check_safeDivide() {
        #expect(safeDivide(10, 4) == 2.5)
        #expect(safeDivide(1, 0) == nil)
    }

    @Test("3. hello", .disabled(if: Todo.notStarted { _ = hello(nil) }, "⏭ not started"))
    func check_hello() {
        #expect(hello("Sam") == "Hello, Sam!")
        #expect(hello(nil) == "Hello, stranger!")
    }

    @Test("4. lengthOf", .disabled(if: Todo.notStarted { _ = lengthOf(nil) }, "⏭ not started"))
    func check_lengthOf() {
        #expect(lengthOf("hello") == 5)
        #expect(lengthOf(nil) == 0)
    }

    @Test("5. firstEven", .disabled(if: Todo.notStarted { _ = firstEven([]) }, "⏭ not started"))
    func check_firstEven() {
        #expect(firstEven([3, 5, 8, 10]) == 8)
        #expect(firstEven([1, 3]) == nil)
        #expect(firstEven([]) == nil)
    }

    @Test("6. firstRepeatedChar", .disabled(if: Todo.notStarted { _ = firstRepeatedChar("") }, "⏭ not started"))
    func check_firstRepeatedChar() {
        #expect(firstRepeatedChar("abcbd") == "b")
        #expect(firstRepeatedChar("abcab") == "a")
        #expect(firstRepeatedChar("abc") == nil)
        #expect(firstRepeatedChar("") == nil)
    }

    @Test("7. sumOfPresent", .disabled(if: Todo.notStarted { _ = sumOfPresent([]) }, "⏭ not started"))
    func check_sumOfPresent() {
        #expect(sumOfPresent([1, nil, 3]) == 4)
        #expect(sumOfPresent([nil, nil]) == 0)
        #expect(sumOfPresent([]) == 0)
    }

    @Test("8. minutes(from:)", .disabled(if: Todo.notStarted { _ = minutes(from: "") }, "⏭ not started"))
    func check_minutes() {
        #expect(minutes(from: "01:30") == 90)
        #expect(minutes(from: "00:00") == 0)
        #expect(minutes(from: "ab:cd") == nil)
        #expect(minutes(from: "1230") == nil)
    }
}
