import Testing
import Support
@testable import Lesson04_Functions

@Suite("Lesson 04 · Functions")
struct Lesson04Checks {
    @Test("1. add", .disabled(if: Todo.notStarted { _ = add(1, 1) }, "⏭ not started"))
    func check_add() {
        #expect(add(2, 3) == 5)
        #expect(add(-1, 1) == 0)
    }

    @Test("2. cube", .disabled(if: Todo.notStarted { _ = cube(1) }, "⏭ not started"))
    func check_cube() {
        #expect(cube(2) == 8)
        #expect(cube(-3) == -27)
    }

    @Test("3. lastDigit(of:)", .disabled(if: Todo.notStarted { _ = lastDigit(of: 1) }, "⏭ not started"))
    func check_lastDigit() {
        #expect(lastDigit(of: 1234) == 4)
        #expect(lastDigit(of: 7) == 7)
        #expect(lastDigit(of: 90) == 0)
    }

    @Test("4. fullName", .disabled(if: Todo.notStarted { _ = fullName(first: "", last: "") }, "⏭ not started"))
    func check_fullName() {
        #expect(fullName(first: "Ada", last: "Lovelace") == "Ada Lovelace")
    }

    @Test("5. shout", .disabled(if: Todo.notStarted { _ = shout("") }, "⏭ not started"))
    func check_shout() {
        #expect(shout("hi") == "HI!")
        #expect(shout("Hello there") == "HELLO THERE!")
    }

    @Test("6. isEven", .disabled(if: Todo.notStarted { _ = isEven(1) }, "⏭ not started"))
    func check_isEven() {
        #expect(isEven(4) == true)
        #expect(isEven(7) == false)
        #expect(isEven(0) == true)
        #expect(isEven(-2) == true)
    }

    @Test("7. celsiusToFahrenheit", .disabled(if: Todo.notStarted { _ = celsiusToFahrenheit(0) }, "⏭ not started"))
    func check_celsiusToFahrenheit() {
        #expect(celsiusToFahrenheit(100) == 212)
        #expect(celsiusToFahrenheit(0) == 32)
        #expect(celsiusToFahrenheit(-40) == -40)
    }

    @Test("8. reverse", .disabled(if: Todo.notStarted { _ = reverse("") }, "⏭ not started"))
    func check_reverse() {
        #expect(reverse("abc") == "cba")
        #expect(reverse("") == "")
    }

    @Test("9. perimeter", .disabled(if: Todo.notStarted { _ = perimeter(width: 1) }, "⏭ not started"))
    func check_perimeter() {
        #expect(perimeter(width: 3, height: 5) == 16)
        #expect(perimeter(width: 4) == 16)
    }
}
