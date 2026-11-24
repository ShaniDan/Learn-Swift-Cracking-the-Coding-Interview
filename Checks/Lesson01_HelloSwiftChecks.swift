import Testing
import Support
@testable import Lesson01_HelloSwift

@Suite("Lesson 01 · Hello Swift")
struct Lesson01Checks {
    @Test("1. myName", .disabled(if: Todo.notStarted { _ = myName() }, "⏭ not started"))
    func check_myName() {
        #expect(!myName().isEmpty, "Return some text in quotes, like \"Sam\".")
    }

    @Test("2. daysInWeek", .disabled(if: Todo.notStarted { _ = daysInWeek() }, "⏭ not started"))
    func check_daysInWeek() {
        #expect(daysInWeek() == 7)
    }

    @Test("3. greeting", .disabled(if: Todo.notStarted { _ = greeting() }, "⏭ not started"))
    func check_greeting() {
        #expect(greeting() == "Hello, Swift!")
    }

    @Test("4. minutesPerDay", .disabled(if: Todo.notStarted { _ = minutesPerDay() }, "⏭ not started"))
    func check_minutesPerDay() {
        #expect(minutesPerDay() == 1440)
    }

    @Test("5. sentence", .disabled(if: Todo.notStarted { _ = sentence() }, "⏭ not started"))
    func check_sentence() {
        #expect(sentence() == "I am learning Swift in 2026")
    }
}
