import Testing
import Support
@testable import Lesson05_Conditions

@Suite("Lesson 05 · Conditions")
struct Lesson05Checks {
    @Test("1. sign", .disabled(if: Todo.notStarted { _ = sign(0) }, "⏭ not started"))
    func check_sign() {
        #expect(sign(5) == "positive")
        #expect(sign(-2) == "negative")
        #expect(sign(0) == "zero")
    }

    @Test("2. maxOfThree", .disabled(if: Todo.notStarted { _ = maxOfThree(1, 2, 3) }, "⏭ not started"))
    func check_maxOfThree() {
        #expect(maxOfThree(1, 2, 3) == 3)
        #expect(maxOfThree(3, 2, 1) == 3)
        #expect(maxOfThree(2, 3, 1) == 3)
        #expect(maxOfThree(5, 5, 1) == 5)
        #expect(maxOfThree(-1, -5, -3) == -1)
    }

    @Test("3. isLeapYear", .disabled(if: Todo.notStarted { _ = isLeapYear(2000) }, "⏭ not started"))
    func check_isLeapYear() {
        #expect(isLeapYear(2024) == true)
        #expect(isLeapYear(2023) == false)
        #expect(isLeapYear(1900) == false)
        #expect(isLeapYear(2000) == true)
        #expect(isLeapYear(2100) == false)
    }

    @Test("4. fizzBuzz", .disabled(if: Todo.notStarted { _ = fizzBuzz(1) }, "⏭ not started"))
    func check_fizzBuzz() {
        #expect(fizzBuzz(15) == "FizzBuzz")
        #expect(fizzBuzz(30) == "FizzBuzz")
        #expect(fizzBuzz(9) == "Fizz")
        #expect(fizzBuzz(10) == "Buzz")
        #expect(fizzBuzz(7) == "7")
    }

    @Test("5. ticketPrice", .disabled(if: Todo.notStarted { _ = ticketPrice(age: 1) }, "⏭ not started"))
    func check_ticketPrice() {
        for (age, price) in [(0, 0), (2, 0), (3, 5), (12, 5), (13, 12), (64, 12), (65, 7), (90, 7)] {
            #expect(ticketPrice(age: age) == price, "age \(age)")
        }
    }

    @Test("6. isVowel", .disabled(if: Todo.notStarted { _ = isVowel("a") }, "⏭ not started"))
    func check_isVowel() {
        for ch in "aeiouAEIOU" { #expect(isVowel(ch) == true, "\(ch) is a vowel") }
        for ch in "bzY" { #expect(isVowel(ch) == false, "\(ch) is not a vowel") }
    }

    @Test("7. sameLength", .disabled(if: Todo.notStarted { _ = sameLength("", "") }, "⏭ not started"))
    func check_sameLength() {
        #expect(sameLength("abc", "cab") == true)
        #expect(sameLength("abc", "ab") == false)
    }
}
