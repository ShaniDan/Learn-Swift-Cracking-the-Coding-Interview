import Testing
import Support
@testable import Lesson11_StructsClasses

@Suite("Lesson 11 · Structs, Classes & Enums")
struct Lesson11Checks {
    @Test("1. Rectangle", .disabled(if: Todo.notStarted {
        var r = Rectangle(width: 1, height: 1); _ = r.area(); _ = r.perimeter(); _ = r.isSquare; r.scale(by: 1)
    }, "⏭ not started"))
    func check_Rectangle() {
        var r = Rectangle(width: 3, height: 4)
        #expect(r.area() == 12)
        #expect(r.perimeter() == 14)
        #expect(r.isSquare == false)
        #expect(Rectangle(width: 5, height: 5).isSquare == true)
        r.scale(by: 2)
        #expect(r.width == 6 && r.height == 8, "after scale(by: 2) the rectangle should be 6 × 8")
    }

    @Test("2. BankAccount", .disabled(if: Todo.notStarted {
        let a = BankAccount(owner: "x"); a.deposit(1); _ = a.withdraw(1)
    }, "⏭ not started"))
    func check_BankAccount() {
        let account = BankAccount(owner: "Ann", balance: 100)
        account.deposit(50)
        #expect(account.balance == 150, "after deposit(50)")
        #expect(account.withdraw(30) == true)
        #expect(account.balance == 120, "after withdraw(30)")
        #expect(account.withdraw(1000) == false, "withdrawing too much should return false")
        account.deposit(-5)
        #expect(account.balance == 120, "a failed withdraw and a negative deposit shouldn't change the balance")
    }

    @Test("3. WordCounter", .disabled(if: Todo.notStarted {
        let c = WordCounter(); c.add("x"); _ = c.count(of: "x"); _ = c.mostCommon()
    }, "⏭ not started"))
    func check_WordCounter() {
        let c = WordCounter()
        #expect(c.mostCommon() == nil, "mostCommon() on an empty counter")
        c.add("x"); c.add("y"); c.add("x")
        #expect(c.count(of: "x") == 2)
        #expect(c.count(of: "z") == 0)
        #expect(c.mostCommon() == "x")
    }

    @Test("4. TrafficLight", .disabled(if: Todo.notStarted { _ = TrafficLight.red.next(); _ = TrafficLight.red.seconds }, "⏭ not started"))
    func check_TrafficLight() {
        #expect(TrafficLight.red.next() == .green)
        #expect(TrafficLight.green.next() == .yellow)
        #expect(TrafficLight.yellow.next() == .red)
        #expect(TrafficLight.red.seconds == 30)
        #expect(TrafficLight.yellow.seconds == 5)
        #expect(TrafficLight.green.seconds == 25)
    }

    @Test("5. chainToArray", .disabled(if: Todo.notStarted { _ = chainToArray(nil) }, "⏭ not started"))
    func check_chainToArray() {
        let chain = ChainNode(1, next: ChainNode(2, next: ChainNode(3)))
        #expect(chainToArray(chain) == [1, 2, 3])
        #expect(chainToArray(nil) == [])
    }

    @Test("6. arrayToChain", .disabled(if: Todo.notStarted { _ = arrayToChain([]) }, "⏭ not started"))
    func check_arrayToChain() {
        var values: [Int] = []
        var node = arrayToChain([1, 2, 3])
        while let n = node, values.count < 100 {
            values.append(n.data)
            node = n.next
        }
        #expect(values == [1, 2, 3])
        #expect(arrayToChain([]) == nil)
    }
}
