import Testing
import Support
@testable import Lesson02_Numbers

@Suite("Lesson 02 · Numbers")
struct Lesson02Checks {
    @Test("1. lastDigit", .disabled(if: Todo.notStarted { _ = lastDigit() }, "⏭ not started"))
    func check_lastDigit() { #expect(lastDigit() == 5) }

    @Test("2. withoutLastDigit", .disabled(if: Todo.notStarted { _ = withoutLastDigit() }, "⏭ not started"))
    func check_withoutLastDigit() { #expect(withoutLastDigit() == 9876) }

    @Test("3. fullWeeks", .disabled(if: Todo.notStarted { _ = fullWeeks() }, "⏭ not started"))
    func check_fullWeeks() { #expect(fullWeeks() == 14) }

    @Test("4. leftoverDays", .disabled(if: Todo.notStarted { _ = leftoverDays() }, "⏭ not started"))
    func check_leftoverDays() { #expect(leftoverDays() == 2) }

    @Test("5. average", .disabled(if: Todo.notStarted { _ = average() }, "⏭ not started"))
    func check_average() { #expect(abs(average() - 84.0) < 0.0001) }

    @Test("6. isBigNumberEven", .disabled(if: Todo.notStarted { _ = isBigNumberEven() }, "⏭ not started"))
    func check_isBigNumberEven() { #expect(isBigNumberEven() == false) }

    @Test("7. twoToTheTen", .disabled(if: Todo.notStarted { _ = twoToTheTen() }, "⏭ not started"))
    func check_twoToTheTen() { #expect(twoToTheTen() == 1024) }

    @Test("8. newPrice", .disabled(if: Todo.notStarted { _ = newPrice() }, "⏭ not started"))
    func check_newPrice() { #expect(abs(newPrice() - 21.49) < 0.0001) }
}
