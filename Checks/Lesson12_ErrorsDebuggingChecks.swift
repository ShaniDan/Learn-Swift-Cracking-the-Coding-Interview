import Testing
import Support
@testable import Lesson12_ErrorsDebugging

@Suite("Lesson 12 · Errors & Debugging")
struct Lesson12Checks {
    @Test("1. validateAge", .disabled(if: Todo.notStarted { _ = try? validateAge(1) }, "⏭ not started"))
    func check_validateAge() throws {
        #expect(try validateAge(30) == 30)
        #expect(try validateAge(0) == 0)
        #expect(try validateAge(150) == 150)
        #expect(throws: AgeError.negative) { try validateAge(-1) }
        #expect(throws: AgeError.tooOld) { try validateAge(151) }
    }

    @Test("2. ageOrMinusOne", .disabled(if: Todo.notStarted { _ = ageOrMinusOne(1) }, "⏭ not started"))
    func check_ageOrMinusOne() {
        #expect(ageOrMinusOne(40) == 40)
        #expect(ageOrMinusOne(-3) == -1)
        #expect(ageOrMinusOne(200) == -1)
    }

    @Test("3. divide(_:by:)", .disabled(if: Todo.notStarted { _ = try? divide(1, by: 1) }, "⏭ not started"))
    func check_divide() throws {
        #expect(try divide(10, by: 3) == 3)
        #expect(throws: MathError.divisionByZero) { try divide(1, by: 0) }
    }

    @Test("4. parseNumber", .disabled(if: Todo.notStarted { _ = parseNumber("1") }, "⏭ not started"))
    func check_parseNumber() {
        #expect(parseNumber("42") == 42.0)
        #expect(parseNumber("3.5") == 3.5)
        #expect(parseNumber("abc") == nil)
    }

    @Test("5. 🐞 buggyCountNegatives", .disabled(if: Todo.notStarted { _ = buggyCountNegatives([1]) }, "⏭ not started"))
    func check_buggyCountNegatives() {
        #expect(buggyCountNegatives([-1, -2, 3]) == 2)
        #expect(buggyCountNegatives([-5]) == 1)
        #expect(buggyCountNegatives([]) == 0)
    }

    @Test("6. 🐞 buggyAverage", .disabled(if: Todo.notStarted { _ = buggyAverage([1]) }, "⏭ not started"))
    func check_buggyAverage() {
        #expect(buggyAverage([1, 2, 3, 4]) == 2.5)
        #expect(buggyAverage([]) == 0)
    }
}
