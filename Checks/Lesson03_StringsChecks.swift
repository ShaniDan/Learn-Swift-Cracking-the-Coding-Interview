import Testing
import Support
@testable import Lesson03_Strings

@Suite("Lesson 03 · Strings")
struct Lesson03Checks {
    @Test("1. firstChar", .disabled(if: Todo.notStarted { _ = firstChar() }, "⏭ not started"))
    func check_firstChar() { #expect(firstChar() == "C") }

    @Test("2. lastChar", .disabled(if: Todo.notStarted { _ = lastChar() }, "⏭ not started"))
    func check_lastChar() { #expect(lastChar() == "w") }

    @Test("3. firstWord", .disabled(if: Todo.notStarted { _ = firstWord() }, "⏭ not started"))
    func check_firstWord() { #expect(firstWord() == "Cracking") }

    @Test("4. reversedText", .disabled(if: Todo.notStarted { _ = reversedText() }, "⏭ not started"))
    func check_reversedText() { #expect(reversedText() == "weivretnI gnidoC eht gnikcarC") }

    @Test("5. lowercaseText", .disabled(if: Todo.notStarted { _ = lowercaseText() }, "⏭ not started"))
    func check_lowercaseText() { #expect(lowercaseText() == "cracking the coding interview") }

    @Test("6. countI", .disabled(if: Todo.notStarted { _ = countI() }, "⏭ not started"))
    func check_countI() { #expect(countI() == 3) }

    @Test("7. words", .disabled(if: Todo.notStarted { _ = words() }, "⏭ not started"))
    func check_words() { #expect(words() == ["Cracking", "the", "Coding", "Interview"]) }

    @Test("8. urlified", .disabled(if: Todo.notStarted { _ = urlified() }, "⏭ not started"))
    func check_urlified() { #expect(urlified() == "Cracking%20the%20Coding%20Interview") }

    @Test("9. hasCoding", .disabled(if: Todo.notStarted { _ = hasCoding() }, "⏭ not started"))
    func check_hasCoding() { #expect(hasCoding() == true) }

    @Test("10. letterPosition", .disabled(if: Todo.notStarted { _ = letterPosition() }, "⏭ not started"))
    func check_letterPosition() { #expect(letterPosition() == 2) }

    @Test("11. characterAtNine", .disabled(if: Todo.notStarted { _ = characterAtNine() }, "⏭ not started"))
    func check_characterAtNine() { #expect(characterAtNine() == "t") }
}
