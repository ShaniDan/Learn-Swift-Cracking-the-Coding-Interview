import Testing
import Support
@testable import Lesson06_Loops

@Suite("Lesson 06 · Loops")
struct Lesson06Checks {
    @Test("1. sumTo", .disabled(if: Todo.notStarted { _ = sumTo(1) }, "⏭ not started"))
    func check_sumTo() {
        for n in [0, 1, 4, 100] { #expect(sumTo(n) == n * (n + 1) / 2, "sumTo(\(n))") }
    }

    @Test("2. factorial", .disabled(if: Todo.notStarted { _ = factorial(1) }, "⏭ not started"))
    func check_factorial() {
        #expect(factorial(0) == 1)
        #expect(factorial(1) == 1)
        #expect(factorial(5) == 120)
        #expect(factorial(10) == 3_628_800)
    }

    @Test("3. countVowels", .disabled(if: Todo.notStarted { _ = countVowels("") }, "⏭ not started"))
    func check_countVowels() {
        #expect(countVowels("Hello World") == 3)
        #expect(countVowels("AEIOU aeiou") == 10)
        #expect(countVowels("rhythm") == 0)
    }

    @Test("4. reverseString", .disabled(if: Todo.notStarted { _ = reverseString("") }, "⏭ not started"))
    func check_reverseString() {
        #expect(reverseString("abc") == "cba")
        #expect(reverseString("") == "")
        #expect(reverseString("racecar") == "racecar")
    }

    @Test("5. countDigits", .disabled(if: Todo.notStarted { _ = countDigits(1) }, "⏭ not started"))
    func check_countDigits() {
        for n in [9, 10, 12345, 1_000_000] { #expect(countDigits(n) == String(n).count, "countDigits(\(n))") }
    }

    @Test("6. sumOfDigits", .disabled(if: Todo.notStarted { _ = sumOfDigits(1) }, "⏭ not started"))
    func check_sumOfDigits() {
        #expect(sumOfDigits(1234) == 10)
        #expect(sumOfDigits(5) == 5)
        #expect(sumOfDigits(909) == 18)
    }

    @Test("7. reverseDigits", .disabled(if: Todo.notStarted { _ = reverseDigits(1) }, "⏭ not started"))
    func check_reverseDigits() {
        #expect(reverseDigits(1234) == 4321)
        #expect(reverseDigits(7) == 7)
        #expect(reverseDigits(1200) == 21)
    }

    @Test("8. isPrime", .disabled(if: Todo.notStarted { _ = isPrime(2) }, "⏭ not started"))
    func check_isPrime() {
        let primes: Set = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 97]
        for n in Array(0..<32) + [97, 100] { #expect(isPrime(n) == primes.contains(n), "isPrime(\(n))") }
    }

    @Test("9. isPalindrome", .disabled(if: Todo.notStarted { _ = isPalindrome("a") }, "⏭ not started"))
    func check_isPalindrome() {
        #expect(isPalindrome("racecar") == true)
        #expect(isPalindrome("abba") == true)
        #expect(isPalindrome("abca") == false)
        #expect(isPalindrome("a") == true)
        #expect(isPalindrome("") == true)
        #expect(isPalindrome("ab") == false)
    }
}
